// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travelapp/pages/navpages/main_page.dart';
import 'package:travelapp/widgets/app_buttoms.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';
import 'package:travelapp/widgets/responsive_buttom.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  int gottenStars=4;
  int selectedIndex=-1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [

            Positioned(child: Container(
              width: double.maxFinite,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("img/mountain.jpeg"),
                  fit: BoxFit.cover
                ),
              ),
            ),
            ),

            Positioned(
              left: 20 ,
              top:  50,
              child: Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainPage(),
                              ),
                              (route) => false);
                }, icon: Icon(Icons.menu),
                color: Colors.white,),
              ],
            ),
            ),
            Positioned(
              top: 280,
              child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(text: "Yosemite", color: Colors.black.withOpacity(0.8),),
                      AppLargeText(text: "\$ 250", color: Color(0xFF989acd) ,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Color(0xFF5d69b3),),

                      SizedBox(height: 5,),

                      AppText(text: "USA, Califórnia", color: Color(0xFF989acd),),
                      
                       SizedBox(height:20),
                   
                    ],
                  ),
                  SizedBox(height: 20,),

                  Row(
                    children: [
                       Wrap(
                    children: List.generate(5, (index) {
                      return Icon(Icons.star, color:index<gottenStars?Color(0xFFe7bb4e):Color(0xFF878593),);
                    },
                    ),
                  ),
                  SizedBox(height: 10,),
                  AppText(text: "(4.0)", color: Color(0xFF878593),),
                    ],
                  ),

                  SizedBox(height: 25,),

                  AppLargeText(text: "Pessoas", color: Colors.black.withOpacity(0.8),size: 20,),
                  SizedBox(height: 5,),
                  AppText(text: "Número de pessoas no seu grupo", color: Color(0xFFababad),),

                  SizedBox(height: 10,),

                  Wrap(
                    children: 
                      List.generate(5, (index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex=index;
                          });

                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: AppButtons(size: 50,
                           color: selectedIndex==index?Colors.white:Colors.black, 
                           backgroundColor: selectedIndex==index?Colors.black:Color(0xFFababad) ,
                            borderColor: selectedIndex==index? Colors.black:Color(0xFFababad),
                            text: (index+1).toString(),
                            ),
                        ),
                      );
                      }  
                      ),
                  ),
                  SizedBox(height: 20,),

                  AppLargeText(text: "Descrição", color: Colors.black.withOpacity(0.8),),

                  SizedBox(height: 10,),

                  AppText(text: "Catch me floating circles in my fishbowl, Keep things fresh She said that I should change my clothes, I exaggerate the life we used to know, oh, oh",
                   color:Color(0xFFababad) ,),
                ],
              ),
            ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
              children: [
                AppButtons(size: 60,
                 color: Color(0xFF878593),
                  backgroundColor: Colors.white,
                   borderColor: Color(0xFF878593),
                   isIcon: true,
                   icon: Icons.favorite_border,
                   ),
                   SizedBox(width:20,),
                   ResponsiveButton(
                    isResponsive: true,
                   ),
              ],
            ),
            ),
           
          ],
          
        ),
      ),
      
    );
  }
}