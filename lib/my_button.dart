import 'package:flutter/material.dart';


class My_button extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final Color buttonColor;
  final double height;
  final double ?width;
  final double radious;
  final VoidCallback onClick;
  final double right;
  final double left;
  final double bottom;


  const My_button({

    Key? key  ,

    required this.text,
    this.textColor=Colors.white,
    this.textSize=14,
    this.buttonColor=Colors.teal,
    this.height=60,
    this.width=double.infinity,
    this.radious=15,
    required this.onClick,
    this.right=0,
    this.left=0,
    this.bottom=0,






  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left , bottom: bottom , right:right ),
      child: Container(
        width: width,

        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                 radious
            )

        ),
        child: MaterialButton(
          onPressed: (){

            onClick;
          },

          height: height,


          color: buttonColor,

          child:  Text(text ,style: TextStyle(color: textColor , fontSize: textSize)),











        ),
      ),
    );
  }
}
