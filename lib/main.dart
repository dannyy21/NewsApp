import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir_news/pages/splashscreen.dart';
import 'package:get/get.dart';
import 'routes/page_routes.dart';
import 'widget/appbar_widget.dart';

  
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
       getPages: pageRouteApp.pages,
      debugShowCheckedModeBanner: false
    );
  }
}