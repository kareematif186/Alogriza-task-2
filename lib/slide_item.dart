import 'package:alogoriza_task/text1.dart';
import 'package:flutter/material.dart';
import 'imgs.dart';










class Slide_item extends StatelessWidget {
  final String text1 ;
  final String text2 ;
  final String url1;



  const Slide_item({

    Key? key  ,

    required this.text1,
    required this.text2,
    required this.url1,





  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Imgs(url: url1, height: 300 ,width: null,),

        Text1(text: text1, height: 60, textSize: 18, textColor: Colors.black, bottom: 15, right:27, left: 0,),

        Text1(text:text2, height: 100, textSize: 11, textColor: Colors.black38, bottom: 0, right:10, left: 10, bold: null,),




      ],
    );
  }
}





final slideList=[



    const Imgs(url: 'assets/img/delivery1.png', height: 300 ,width: null,),

    const Text1(text: "Get food delivery to your \n door step asap", height: 60, textSize: 18, textColor: Colors.black, bottom: 15, right:27, left: 0,),

    const Text1(text:"We have young and professional delivery team that will bring your food as soon as possible to your doorstep", height: 100, textSize: 11, textColor: Colors.black38, bottom: 0, right:10, left: 10, bold: null,),


  const Imgs(url: 'assets/img/delivery1.png', height: 300 ,width: null,),

  const Text1(text: "Get food delivery to your \n door step asap", height: 60, textSize: 18, textColor: Colors.black, bottom: 15, right:27, left: 0,),

  const Text1(text:"We have young and professional delivery team that will bring your food as soon as possible to your doorstep", height: 100, textSize: 11, textColor: Colors.black38, bottom: 0, right:10, left: 10, bold: null,),



];