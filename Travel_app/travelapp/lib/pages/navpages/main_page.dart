
// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/pages/navpages/bar_item_page.dart';
import 'package:travelapp/pages/home_page.dart';
import 'package:travelapp/pages/navpages/my_page.dart';
import 'package:travelapp/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
 
 
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage()
  ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
       
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black45,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        
 
        items: [
          BottomNavigationBarItem(label:"home" ,icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label:"Barra" ,icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label:"pesquisa" ,icon: Icon(Icons.search)),
          BottomNavigationBarItem(label:"eu" ,icon: Icon(Icons.person)),
        ],
      ) ,
    );
  }
}