import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tugasakhir_news/pages/BottomBar.dart';

import '../routes/routename.dart';


class RegisterScreen extends StatefulWidget {

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
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
              child: Text("Register",
                    style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 30
                    ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Image.asset("assets/img/flutter.png",
            //   height: 100,
            //   width: 100,
            //   ),
            // ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller:_emailController,
                decoration:InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email@gmail.com"
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller:_passwordController,
                obscureText: true,
                decoration:InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password 6 char or more"
                ),
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: raisedButtonStyle,
                child: Text("Register"),
                 onPressed: () async {
                    await _firebaseAuth.createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text        
                    ).then((value) => Get.toNamed(RouteName.page_2));
                  
          }
              )
            ),
            
          ],),
      )
      
            ]))));
  }
}

final ButtonStyle raisedButtonStyle= ElevatedButton.styleFrom(
  onPrimary: Colors.grey[300],
  primary: Colors.blue[300],
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
);