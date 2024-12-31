import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_app_main/users/authentication/signup_scren.dart';
import 'package:food_delivery_app_main/users/fragments/dashboard_of_fragments.dart';
import 'package:food_delivery_app_main/users/model/user.dart';
import 'package:food_delivery_app_main/users/userPreferences/user_prefences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../api_connection/api_connection.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formeKey=GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var isObsecure =true.obs;

  loginUserNow() async
  {
    try
        {
          var res=await http.post(
              Uri.parse(API.login),
              body: {
                "user_email":emailController.text.trim(),
                "user_password":passwordController.text.trim(),
              }
          );
          if(res.statusCode==200)
          {
            var resBodyOfLogin = jsonDecode(res.body);
            if(resBodyOfLogin['success']== true)
            {
              Fluttertoast.showToast(msg: "contragulations, you are loggned-in succesfully");
              User UserInfo=User.fromJson(resBodyOfLogin["userData"]);
              await RememberUserPrefs.storeUserInfo(UserInfo);

                Get.to(DashboardOfFragments());

            }
          }
          else{
            Fluttertoast.showToast(msg: "please write a correct password or email try again");
          }
        }
        catch(errorMsg)
    {
      print("error::"+errorMsg.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context,cons)
        {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: cons.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 285,
                    child: Image.asset(
                      "assets/images/logo.jpg"
                    ),
                  ),
                  //login screen
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color:Colors.white24,
                        borderRadius: BorderRadius.all(
                          Radius.circular(60),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color:Colors.black26,
                            offset:Offset(0,-3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30,30,30,8.0),
                        child: Column(
                          children: [
                            //email-password
                            Form(
                              key:formeKey,
                              child: Column(
                                children: [
                                  SizedBox(height: 30,),
                                  TextFormField(
                                    controller: emailController,
                                    validator: (val)=>val ==""? " please write a email":null,
                                    decoration: InputDecoration(
                                      prefixIcon:  const Icon(
                                        Icons.email,
                                        color:Colors.black
                                      ),
                                        hintText: "Email",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60
                                        ),
                                      ),
                                      enabledBorder:OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.white60
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.white60
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.white60
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                  const SizedBox(height: 18,),
                                  Obx(() => TextFormField(
                                    controller: passwordController,
                                    obscureText: isObsecure.value,
                                    validator: (val)=>val ==""? " please write a password":null,
                                    decoration: InputDecoration(
                                      prefixIcon:  const Icon(
                                          Icons.vpn_key_sharp,
                                          color:Colors.black
                                      ),
                                      suffixIcon: Obx(
                                              ()=>GestureDetector(
                                            onTap: ()
                                            {
                                              isObsecure.value=!isObsecure.value;
                                            },
                                            child: Icon(
                                              isObsecure.value ? Icons.visibility_off: Icons.visibility,
                                              color: Colors.black,
                                            ),
                                          )
                                      ),
                                      hintText: "password",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.white60
                                        ),
                                      ),
                                      enabledBorder:OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.white60
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.white60
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.white60
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),),
                                  const SizedBox(height: 18,),
                                  Material(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30),
                                    child: InkWell(
                                      onTap: ()
                                      {
                                        if(formeKey.currentState!.validate())
                                          {
                                            loginUserNow();
                                          }
                                      },
                                      borderRadius: BorderRadius.circular(30),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 28,
                                        ),
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 16,),
                            //don't have account
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't Have An account?"),
                                TextButton(onPressed:(){
                                  Get.to(SignupScreen());
                                },
                                    child: const Text(
                                      "Signup Here",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16
                                      ),
                                    ))
                              ],
                            ),
                            const Text("or",style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 16,
                            ),),
                            //admin
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Are you have admin"),
                                TextButton(onPressed:(){

                                },
                                    child: const Text(
                                      "Click  Here",
                                      style: TextStyle(
                                          color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
        );

        },
      ),
    );
  }
}