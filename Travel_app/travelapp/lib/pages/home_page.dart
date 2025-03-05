// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/pages/detail_page.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin{
  var images ={
    "balloning.png": "Balão Quente",
    "hiking.png": "Esquiar",
    "kayaking.png": "Kayak",
    "snorkling.png": "Nadar",
  };
 
  @override
  Widget build(BuildContext context) {
     TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 70, left: 20),
          child: Row(
             children:[
        Icon(Icons.menu, size: 30, color: Colors.black54,),
        Expanded(child: Container()),
        Container(
          margin: const EdgeInsets.only(right: 20),
          width: 50,
          height: 50,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.5)
          ),
        ),
      ],
          ),
        ),
           SizedBox(height: 30,),

           Container(
            margin: const EdgeInsets.only(left:20),
            child: AppLargeText(text: "Descubra"),
           ),

           SizedBox(height: 20,),

           Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20) ,
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true ,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: Color(0xFF5d69b3), radius: 4 ),
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  Tab(text: "Lugares",),
                  Tab(text: "Inspiração",),
                  Tab(text: "Emoções",)
                ],
              ),
            ),
           ),
           Container(
            padding: const EdgeInsets.only(left: 25),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
              ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) { 
                  return
                   GestureDetector(
                    onTap: () => {
         Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailPage(),
                              ),
                              (route) => false)
        },
                     child: Container(
                      
                                     margin: const EdgeInsets.only(right: 15, top: 10),
                                     width: 200,
                                     height: 300,
                                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                     color: Colors.white,
                                     image: DecorationImage(image:
                     AssetImage( 
                      "img/mountain.jpeg",
                                     ),
                                     fit: BoxFit.cover
                                     ),
                                     ),
                                   ),
                   );

                 },
              
              ),
                Text("data"),
                Text("tchau")
              ],
            ),
           ),
           SizedBox(height: 30,),
           Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore mais", size:22,),
                
                AppText(
                  text: "Veja tudo" , color: Color(0xFF989acd),),
              ],
             ),
           ),
           SizedBox(height: 20,),
           Container(
            height: 120,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
              return Container(
                margin: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                     Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: DecorationImage(image: AssetImage(
                      "img/"+images.keys.elementAt(index)
                    ),
                    fit: BoxFit.cover
                    ),
                    ),
                    ),
                  
                  SizedBox(height: 10,),

                    Container(
                      child: AppText(text: images.values.elementAt(index),
                      color: Color(0xFF878593),
                      ),
                    ),
                  ],
                ),
              );
            }),
           ),

      ],
      ),
    );
  }
} 


class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color:color, radius:radius);
  }

  
}


class _CirclePainter extends BoxPainter {
   final Color color;
  double radius;
   _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, 
  ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;
    final Offset circleOffset = Offset(configuration.size!.width/2, configuration.size!.height-radius);


    canvas.drawCircle(offset+circleOffset, radius, _paint);
    // TODO: implement paint
  }
    
  }