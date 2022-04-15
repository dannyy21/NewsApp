import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasakhir_news/model/user.dart';
import 'package:tugasakhir_news/utils/userpref.dart';
import 'package:tugasakhir_news/widget/appbar_widget.dart';
import 'package:tugasakhir_news/widget/button_widget.dart';
import 'package:tugasakhir_news/widget/profile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../routes/routename.dart';
import 'Login.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
     FirebaseAuth auth = FirebaseAuth.instance;
    if(auth.currentUser != null){
      print(auth.currentUser!.email);
      }
    final user = UserPreferences.myUser;    

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
              height:30
            ),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          Center( 
            child: Text.rich(
                TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: auth.currentUser!.email,
                    style: TextStyle(color: Colors.black),
                  ),
                ]),
                    style: TextStyle(fontSize: 30),
         ),),
          
          const SizedBox(height: 24),
          const SizedBox(height: 48),
          buildAbout(user),
          Container(
                child: ElevatedButton(
                  onPressed:() {
                    _signOut().then((value) => Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(
                      builder: (context)=> LoginScreen())));
                  },
                  child: Text('Logout'),
                ),
              )
        ],
      ),
    );
  }
Future<void> _signOut()async{
    await FirebaseAuth.instance.signOut();
  }

  Widget buildAbout(Account user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}