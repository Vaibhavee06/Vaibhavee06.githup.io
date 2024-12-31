

import 'package:flutter/material.dart';
import 'package:food_delivery_app_main/common/Colors.dart';
import 'package:food_delivery_app_main/common_widget/category_cell.dart';
import 'package:food_delivery_app_main/common_widget/round_txtfield.dart';
import 'package:food_delivery_app_main/users/fragments/FamilyRestauratnt.dart';
import 'package:food_delivery_app_main/users/fragments/item_details_view.dart';
import 'package:food_delivery_app_main/users/fragments/my_order_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/most_popular_cell.dart';
import '../../common_widget/popular_resutaurant_row.dart';
import '../../common_widget/recent_item_row.dart';
import '../../common_widget/view_all_title_row.dart';

class HomeFragmentScreen extends StatefulWidget {
  const HomeFragmentScreen({super.key});

  @override
  State<HomeFragmentScreen> createState() => _HomeFragmentScreenState();
}

class _HomeFragmentScreenState extends State<HomeFragmentScreen> {
  TextEditingController txtSearch = TextEditingController();
  List catArr = [
    {"image": "assets/img/cat_offer.png", "name": "Fastfood"},
    {"image": "assets/img/cat_4.png", "name": "Indian"},
    {"image": "assets/img/south indiad.jpeg", "name": "south indian"},
    {"image": "assets/img/cat_3.png", "name": "Italian"},

  ];

  List popArr = [
    {
      "image": "assets/img/res_1.png",
      "name": "Wake up call cafe",
      "rate": "4.0",
      "rating": "124",
      "type": "nadiad",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/res_2.png",
      "name": "Family Restaurant",
      "rate": "4.7",
      "rating": "124",
      "type": "VVnagar",
      "food_type": "All type of Food"
    },
    {
      "image": "assets/img/res_3.png",
      "name": "cookie love bakery",
      "rate": "2.9",
      "rating": "124",
      "type": "gandhinagar",
      "food_type": "Bakery"
    },
  ];

  List mostPopArr = [
    {
      "image": "assets/img/m_res_1.png",
      "name": "pizza huts",
      "rate": "4.9",
      "rating": "124",
      "type": "nadiad",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/m_res_2.png",
      "name": "quick cafe",
      "rate": "5.0",
      "rating": "124",
      "type": "ahmedabad",
      "food_type": "Western Food"
    },
  ];

  List recentArr = [
    {
      "image": "assets/img/item_1.png",
      "name": "minimal pizza",
      "rate": "4.4",
      "rating": "124",
      "type": "vadodra",
      "food_type": "Western Food"
    },
    {
      "image": "assets/img/item_2.png",
      "name": "papa's cafe",
      "rate": "4.9",
      "rating": "124",
      "type": "nadiad",
      "food_type": "Cafe "
    },
    {
      "image": "assets/img/item_3.png",
      "name": "Eta the pizza",
      "rate": "3.9",
      "rating": "124",
      "type": "anand",
      "food_type": "Western Food"
    },
  ];
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
        child: Padding(padding:  const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Good Morning",
                      style:TextStyle(color: TColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    IconButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyOrderView()));
                    },
                      icon: Image.asset(
                        "assets/img/shopping_cart.png",
                        width: 25,
                        height: 25,
                      ),)
                  ],),),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // children: [
                  //   // Text(
                  //   //   "Delivering to",
                  //   //   style:
                  //   //   TextStyle(color: TColor.secondaryText, fontSize: 11),
                  //   // ),
                  //   const SizedBox(
                  //     height: 6,
                  //   ),
                  //   Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       // Text(
                  //       //   "Current Location",
                  //       //   style: TextStyle(
                  //       //       color: TColor.secondaryText,
                  //       //       fontSize: 16,
                  //       //       fontWeight: FontWeight.w700),
                  //       // ),
                  //       const SizedBox(
                  //         width: 25,
                  //       ),
                  //       Image.asset(
                  //         "assets/img/dropdown.png",
                  //         width: 12,
                  //         height: 12,
                  //       )
                  //     ],
                  //   )
                  // ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(hintText: "Search Food",
                  controller: txtSearch,
                  left: Container(
                    alignment: Alignment.center,
                    width: 30,
                    child: Image.asset(
                      "assets/img/search.png",
                      width: 20,
                      height: 20,
                    ),
                  ),),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: catArr.length,
                  itemBuilder: ((context, index) {
                    var cObj = catArr[index] as Map? ?? {};
                    return CategoryCell(
                      cObj: cObj,
                      onTap: () {},
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Popular Restaurants",

                  onView: () {

                  },

                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: popArr.length,
                itemBuilder: ((context, index) {
                  var pObj = popArr[index] as Map? ?? {};
                  var countBase = pObj["base"] as int? ?? 0;
                  return PopularRestaurantRow(
                    pObj: pObj,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const ItemDetailsView()));
                    },

                  );
                }),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Most Popular",
                  onView: () {},
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: mostPopArr.length,
                  itemBuilder: ((context, index) {
                    var mObj = mostPopArr[index] as Map? ?? {};
                    return MostPopularCell(
                      mObj: mObj,
                      onTap: () {},
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Recent Items",
                  onView: () {},
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: recentArr.length,
                itemBuilder: ((context, index) {
                  var rObj = recentArr[index] as Map? ?? {};
                  return RecentItemRow(
                    rObj: rObj,
                    onTap: () {},
                  );}),
              ),],
          ),
        ),
      ),
    );
  }
}
