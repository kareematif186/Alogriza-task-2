import 'package:flutter/material.dart';

class Imgs extends StatelessWidget {

  final double ?width;
  final double ?height;
  final String url;



  const Imgs({
    Key? key,

    this.width=200,
    this.height=60,
    required this.url,











  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        //height: 40,
          child: Image.asset(url ,
            height: height,
            width: width,
          )
      ),
    );
  }
}
