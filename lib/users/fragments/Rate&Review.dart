// ignore_for_file: void_checks

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app_main/common/Font.dart';
import '../../common/Colors.dart';
class RateReview extends StatefulWidget {
  //const RateReview({Key key}) : super(key: key);

  @override
  State<RateReview> createState() => _RateReviewState();
}

class _RateReviewState extends State<RateReview> {
  @override

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
       backgroundColor: Appcolors.background,
      appBar: AppBar(
        backgroundColor: Appcolors.blue,
        elevation: 0,
        toolbarHeight: 5,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Appcolors.blue1),
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 20),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,size: 35,)),

                    SizedBox(width: width*0.25,),

                    Text('Rate & Review',
                      ),

                  ],
                ),
              ),
            ),

            Image.asset('assets/img/res_1.png'),

            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: Text('Thank you for using our service!',style: Textstyle2Light18.appbartextstyle.copyWith(
                  fontSize: 20,fontWeight: FontWeight.w600
              ),),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 20),
              child: Text('Every review and rating we receive will be use to improve our service. We recommend you give us your honest opinion based on your experiance.',style: Textstyle2Light18.appbartextstyle.copyWith(
                  fontSize: 12,fontWeight: FontWeight.w400
              ),),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Rate',style: Textstyle2Light18.appbartextstyle.copyWith(
                  fontSize: 20,fontWeight: FontWeight.w600
              ),),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,top: 5),
              child: RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => ImageIcon(
                  AssetImage("assets/img/staricon3.png"),color : CupertinoColors.activeBlue,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 32,right: 32,top: 20),
              child: Row(
                children: [
                  Container(
                    width: width*0.4,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Appcolors.green1,
                      border: Border.all(color: Appcolors.greenlight),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text('Cancel',style: Textstyle2Light18.appbartextstyle.copyWith(
                        fontSize: 20,fontWeight: FontWeight.w600,
                      ),),
                    ),
                  ),

                  Expanded(child: SizedBox()),

                  InkWell(

                    /*onTap: (){
                      return showDialog(
                        context: context,
                        builder: (ctx) => Dialog(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,top: 10,right: 15),
                            child: Container(
                              padding: const EdgeInsets.only(left: 15,top: 10,right: 15,bottom: 15),
                              width: width*0.2,
                              height: height*0.25,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Rate & Review',style: Textstyle2Light18.appbartextstyle.copyWith(
                                    fontWeight: FontWeight.w600,fontSize: 20,
                                  ),),

                                  Expanded(child: SizedBox()),

                                  Text('Your rating & review have been successfully submitted!',style: Textstyle2Light18.appbartextstyle.copyWith(
                                    fontWeight: FontWeight.w400,fontSize: 12,
                                  ),),

                                  Expanded(child: SizedBox()),

                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },*/

                    child: Container(
                      width: width*0.38,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Appcolors.green1,
                        border: Border.all(color: Appcolors.greenlight),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text('Submit',style: Textstyle2Light18.appbartextstyle.copyWith(
                          fontSize: 20,fontWeight: FontWeight.w600,
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}