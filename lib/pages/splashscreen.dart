
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasakhir_news/pages/Login.dart';

import '../routes/routename.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
          ()=>Get.toNamed(RouteName.page_2));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:
      Image.network("https://i.pinimg.com/564x/08/d5/e9/08d5e94768b2a67efd06fd185f69b581.jpg")
    );
  }
}