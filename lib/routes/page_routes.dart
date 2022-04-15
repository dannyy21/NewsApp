
import 'package:get/get.dart';
import 'package:tugasakhir_news/main.dart';
import 'package:tugasakhir_news/model/user.dart';
import 'package:tugasakhir_news/pages/Login.dart';
import 'package:tugasakhir_news/pages/Register.dart';
import 'package:tugasakhir_news/pages/account.dart';
import 'package:tugasakhir_news/pages/BottomBar.dart';
import 'package:tugasakhir_news/pages/splashscreen.dart';
import 'package:tugasakhir_news/routes/routename.dart';

import '../pages/news_business.dart';
import '../pages/search.dart';

class pageRouteApp{
  static final pages = [
    GetPage(
      name : RouteName.page_1,
      page : () => SplashScreen(), 
    ),
    GetPage(
      name : RouteName.page_2,
      page : () => LoginScreen(), 
    ),
    GetPage(
      name : RouteName.page_3,
      page : () => BottomBar(), 
    ),
    GetPage(
      name : RouteName.page_4,
      page : () => HomePage(), 
    ),
    GetPage(
      name : RouteName.page_5,
      page : () => Search(), 
    ),
    GetPage(
      name : RouteName.page_6,
      page : () => ProfilePage(), 
    ),
    GetPage(
      name : RouteName.page_7,
      page : () => RegisterScreen(), 
    ),
    
  ];
}