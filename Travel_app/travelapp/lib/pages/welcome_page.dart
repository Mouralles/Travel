import 'package:flutter/material.dart';
import 'package:travelapp/pages/navpages/main_page.dart';
import 'package:travelapp/widgets/app_large_text.dart';
import 'package:travelapp/widgets/app_text.dart';
import 'package:travelapp/widgets/responsive_buttom.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({ Key? key }) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  List h1 = [
    "Viagens imperdíveis",
    "Não só para aventureiros",
    "Busque seu local de paz",
  ];

  List h2 =[
    "Montanhas",
    "Paisagens",
    "Chalés"
  ];

  List h3 =[
    "Para todos os públicos, para amantes de aventura até amantes de paisagens.",
    "Lugares Incríveis para se encontrar com a paz interior por um ótimo preço",
    "Para descansar após a aventura ou apenas para relaxar tranquileba"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index){

        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: 
            DecorationImage(
              image: AssetImage(
                "img/"+images[index]),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 150, left: 20, right: 20, ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(text: h1[index] ),
                    AppText(text: h2[index], size: 30,),
                    SizedBox(height: 20,),
                    
                    SizedBox(
                      width: 250,
                      child: AppText(
                        text: h3[index],
                        color: Color(0xFF878593),
                        size: 14,
                      ),
                    ),
                    SizedBox(height: 40,),
                    ResponsiveButton(width: 110,),

                  ],
                ),
                Column(
                  children: List.generate(3, (indexDots) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      width: 8,
                      height: index==indexDots?25:8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:index==indexDots?Color(0xFF5d69b3):Color.fromARGB(104, 93, 105, 179),

                      ),
                    );
                  } ),
                ),
                Column(
                  children: [
                    Container(
                      
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      ) ,
    );
  }
} 




 
