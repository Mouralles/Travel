import 'package:flutter/material.dart';
import 'package:travelapp/pages/home_page.dart';
import 'package:travelapp/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
 ResponsiveButton({ Key? key, this.width=120, this.isResponsive=false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: () => {
         Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                              (route) => false)
        },
        child: Container(
          width: isResponsive==true?double.maxFinite:width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF5d69b3),
          ),
          child: Row(
            mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(right: 5)),
              isResponsive==true?Container(margin: const EdgeInsets.only(left: 20),
              child: AppText(text: "Finalize a compra ", color: Colors.white,)):Container(),
              Image.asset("img/button-one.png"),
            ],
          ),
        ),
      ),
    );
  }
}