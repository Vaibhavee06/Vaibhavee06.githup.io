import 'package:food_delivery_app_main/users/userPreferences/user_prefences.dart';
import 'package:get/get.dart';

import '../model/user.dart';

class currentUser extends GetxController
{
  Rx<User> _currentUser=User(0,'','','').obs;
  User get user=>_currentUser.value;
  getUserInfo() async
  {
    User? getUserInfoFromLocalStorage= await RememberUserPrefs.readUserInfo();
    _currentUser.value=getUserInfoFromLocalStorage!;
  }
}