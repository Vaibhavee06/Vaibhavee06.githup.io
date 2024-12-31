import 'package:flutter/material.dart';
import 'package:food_delivery_app_main/on_boarding/on_boading.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  void initState()
  {
    super.initState();
    goWelcomePage();
  }
  void goWelcomePage() async{
    await Future.delayed(const Duration(seconds: 3));
    welcomePage();
  }
  void welcomePage()
  {
    Navigator.push(context,MaterialPageRoute(builder: (context)=>const OnBoardingView()));
  }
  @override
  Widget build(BuildContext context) {
    var media=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/img/splash_bg.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/img/logo.jpg",
            width: media.width * 0.55,
            height: media.width * 0.30,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
