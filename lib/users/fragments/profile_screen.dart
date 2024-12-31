
import 'package:flutter/material.dart';
import 'package:food_delivery_app_main/users/authentication/login_screen.dart';
import 'package:food_delivery_app_main/users/userPreferences/user_prefences.dart';
import 'package:get/get.dart';
import '../../common/color_extension.dart';
import '../userPreferences/current_user.dart';

class ProfileFragmentScreen extends StatelessWidget {
  final currentUser _currentUser=Get.put(currentUser());
  signOutuser() async
  {
    var resultRespone = await Get.dialog(AlertDialog(backgroundColor: Colors.grey,
      title:const Text
        ("LogOut",
        style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),),
    content:const  Text(
      "Are you sure? \nYou want to logout from App?",
    ),
    actions: [
      TextButton(onPressed: ()
          {
            Get.back();
          },
          child:const  Text("No",
          style: TextStyle(
            color: Colors.black,
          ),)),
      TextButton(onPressed: ()
      {
        Get.back(result: "LoggedOut");
      },
          child:const  Text("Yes",
            style: TextStyle(
              color: Colors.black,
            ),)),
    ],));
    if(resultRespone=="LoggedOut")
      {
        RememberUserPrefs.removeUserInfo().then((value)
        {
           Get.off(LoginScreen());
        });
      }
  }

  Widget userInfoItemProfile(IconData iconData,String userData)
  {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(iconData,size: 30,color: Colors.white,),
          const SizedBox(width: 16,),
          Text(userData,
          style: const TextStyle(fontSize: 15,),)
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(32),
      children: [
        Center(
          child: Image.asset(
            "assets/images/profile.png",
            width: 42,
            height: 82,
          )
        ),
       const  SizedBox(
          height: 20,
        ),
        userInfoItemProfile(Icons.person, _currentUser.user.user_name),
        const  SizedBox(
          height: 20,
        ),
        userInfoItemProfile(Icons.email, _currentUser.user.user_email),
        const  SizedBox(
          height: 20,
        ),
        Center(
          child: Material(
            color: TColor.primary,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: ()
              {
                signOutuser();
              },
              borderRadius: BorderRadius.circular(32),
              child:const Padding(
                padding:EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                child: Text(
                  "sign Out",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
