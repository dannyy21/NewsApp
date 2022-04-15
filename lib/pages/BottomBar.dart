import 'package:flutter/material.dart';
import 'package:tugasakhir_news/main.dart';
import 'package:tugasakhir_news/pages/account.dart';
import 'package:tugasakhir_news/pages/search.dart';

import 'news_business.dart';

class BottomBar extends StatefulWidget {
  // final String value;
  // HomePage({
  //   Key? key,
  //   required String this.value,
  // }) : super(key: key);
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  
  int _selectedIndex = 0;
  final List<Widget> _children =[
      HomePage(),
      Search(),
      ProfilePage()
  ];
  
  void onTappedBar(int index){
    setState((){
      _selectedIndex = index;
    });
  }
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    // HomePage(),
    Text(
      'Index 1: Home',
      style: optionStyle,
    ),
    Text(
      'Index 2: Search',
      style: optionStyle,
    ),
    Text(
      'Index 3: Account',
      style: optionStyle,
    ),
  ];
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // onTap : onTappedBar,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
         currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple.shade400,
         onTap: onTappedBar,
      ),
    );
  }
}
