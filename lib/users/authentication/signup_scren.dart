
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_app_main/api_connection/api_connection.dart';
import 'package:food_delivery_app_main/users/authentication/login_screen.dart';
import 'package:food_delivery_app_main/users/model/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var formeKey=GlobalKey<FormState>();
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var isObsecure =true.obs;
  validateUserEmail() async
  {
    try{
      var res= await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'user_email':emailController.text.trim(),
        }
      );
      if(res.statusCode==200)
        {
          var resBodyOfValidateEmail=jsonDecode(res.body);

          if(resBodyOfValidateEmail['emailFound']== true){
            Fluttertoast.showToast(msg: "Email is already in someone else use, try another once ");

          }
          else{
            registerAndsaveUserRecord();
          }
        }
    }
    catch(e)
    {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }
  registerAndsaveUserRecord() async
  {
    User userModel=User(
      1,
      nameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    try{
      var res=await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJson(),
      );
      if(res.statusCode==200)
        {
          var resBodyOfSignUp = jsonDecode(res.body);
          if(resBodyOfSignUp['success']== true)
            {
              Fluttertoast.showToast(msg: "contragulations, you are Signup succesfully");
              setState(() {
                nameController..clear();
                emailController.clear();
                passwordController.clear();

              });

            }
          else{
            Fluttertoast.showToast(msg: "error occurs try again");
          }
        }
    }
    catch(e)
    {
      print(e.toString());
      Fluttertoast.showToast(msg:e.toString());
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
                        "assets/images/logo2.jpg"
                    ),
                  ),
                  //Signup screen
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
                                    controller: nameController,
                                    validator: (val)=>val ==""? " please write a name":null,
                                    decoration: InputDecoration(
                                      prefixIcon:  const Icon(
                                          Icons.person,
                                          color:Colors.black
                                      ),
                                      hintText: "Name",
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
                                  TextFormField(
                                    controller: emailController,
                                    validator: (val)=>val ==""? " please write a email":null,
                                    decoration: InputDecoration(
                                      prefixIcon:  const Icon(
                                          Icons.email,
                                          color:Colors.black
                                      ),
                                      hintText: "emails",
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
                                              isObsecure.value= isObsecure.value;
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
                                            validateUserEmail();
                                          }
                                      },
                                      borderRadius: BorderRadius.circular(30),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 28,
                                        ),
                                        child: Text(
                                          "SignUp",
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
                            const SizedBox(height: 16,),
                            //already  have account
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have An account?"),
                                TextButton(onPressed:(){
                                  Get.to(LoginScreen());
                                },
                                    child: const Text(
                                      "login  Here",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16
                                      ),
                                    )),
                              ],
                            ),
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