import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tugasakhir_news/pages/Register.dart';
import 'package:tugasakhir_news/pages/BottomBar.dart';

import '../routes/routename.dart';


class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(104, 176, 21, 238),
                      Color.fromARGB(184, 167, 28, 231),
                      Color.fromARGB(193, 167, 28, 231),
                      Color.fromARGB(248, 167, 28, 231),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),Padding(
        padding: EdgeInsets.all(10),
        child : ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 40),
              child: Text("E-News",
                    style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 30
                    ),
              ),
            ),
            SizedBox(
              height: 320,
            ),
             Container(
             child: RichText(
             text: TextSpan(
          children: [
            TextSpan(
              text: '   Email',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),],
            ),)),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller:_emailController,
                decoration:InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "email@gmail.com"
                ),
              ),
            ),
            Container(
             child: RichText(
             text: TextSpan(
          children: [
            TextSpan(
              text: '   Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),],
            ),)),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller:_passwordController,
                obscureText: true,
                decoration:InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Your Password 6 char or more"
                ),
              ),
            ),
            TextButton(onPressed: () {

            },
            child: Text("Forgot Password?"),
            ),
            
            SizedBox(
              height: 10,
            ),
             Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: raisedButtonStyle,
                child: Text("Login"),
                 onPressed: () async{
                  await _firebaseAuth.signInWithEmailAndPassword(
                    email: _emailController.text, 
                    password: _passwordController.text
                    ).then((value) => Get.toNamed(RouteName.page_3));
          },
              )
            ),
             TextButton(onPressed: () {
              Get.toNamed(RouteName.page_7);
            },
            child: Text("Sign Up" ),
            ),
          ],),
      )
      
            ]))));
  }
}

final ButtonStyle raisedButtonStyle= ElevatedButton.styleFrom(
  onPrimary: Color.fromRGBO(243, 243, 243, 1),
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),
);