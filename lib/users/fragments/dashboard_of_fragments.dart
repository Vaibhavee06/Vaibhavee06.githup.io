import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app_main/users/fragments/home_fragment_screen.dart';
import 'package:food_delivery_app_main/users/fragments/menu_view.dart';
import 'package:food_delivery_app_main/users/fragments/more_view.dart';
import 'package:food_delivery_app_main/users/fragments/notification_view.dart';
import 'package:food_delivery_app_main/users/fragments/offer_view.dart';
import 'package:food_delivery_app_main/users/fragments/profile_screen.dart';
import 'package:food_delivery_app_main/users/userPreferences/current_user.dart';
import 'package:get/get.dart';
import '../../common/color_extension.dart';

class DashboardOfFragments extends
StatelessWidget {
  currentUser _rememberCurrentUser=Get.put(currentUser());
  List<Widget> _fragmentScreen=
      [
        HomeFragmentScreen(),
        MenuView(),
        OfferView(),
        MoreView(),
        ProfileFragmentScreen(),

      ];
  List _navigationButtonsProperties=
      [
        {

          "active_icons":Icons.home,
          "non_active_icons":Icons.home_outlined,
          "lable":"Home",
        },
        {
          "active_icons":Icons.food_bank_sharp,
          "non_active_icons":Icons.food_bank_sharp,
          "lable":"Menu",
        },
        {
          "active_icons":Icons.fastfood_rounded,
          "non_active_icons":Icons.fastfood_rounded,
          "lable":"Offers",
        },
        {
          "active_icons":Icons.menu_open_rounded,
          "non_active_icons":Icons.menu_open_rounded,
          "lable":"More",
        },
        {
          "active_icons":Icons.person,
          "non_active_icons":Icons.person_outline,
          "lable":"Profile",
        },

      ];
  RxInt _indexNumber=0.obs;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: currentUser(),
    initState: (currentUser)
      {
        _rememberCurrentUser.getUserInfo();
      },
    builder: (controller)
      {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Obx(
                    ()=>_fragmentScreen[_indexNumber.value]),
          ),
          bottomNavigationBar: Obx(
              ()=>BottomNavigationBar(
                currentIndex: _indexNumber.value,
              onTap: (value)
                {
                  _indexNumber.value=value;
                },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.white,
              unselectedItemColor: TColor.secondaryText,
              items: List.generate(5, (index) {
                var navBtnProperty= _navigationButtonsProperties[index];
                return BottomNavigationBarItem(
                  backgroundColor: Colors.indigo,
                  icon: Icon(navBtnProperty["non_active_icons"]),
                  activeIcon: Icon(navBtnProperty["active_icons"]),
                label: navBtnProperty["lable"],
                );
              }),)
          ),
        );
      },);
  }
}
