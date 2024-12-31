import 'package:flutter/material.dart';
import 'package:food_delivery_app_main/on_boarding/startup_view.dart';
import 'package:food_delivery_app_main/users/authentication/login_screen.dart';
import 'package:food_delivery_app_main/users/fragments/dashboard_of_fragments.dart';
import 'package:food_delivery_app_main/users/userPreferences/user_prefences.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'food delivry',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      ),
      home:FutureBuilder(
        future:RememberUserPrefs.readUserInfo(),
        builder: (context,dataSanpShot)
        {
          if(dataSanpShot.data==null)
            {
              return StartupView();
              //return LoginScreen();
            }
          else
            {
              return DashboardOfFragments();
            }
        },
      ) ,
    );
  }
}

