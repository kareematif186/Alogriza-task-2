import 'package:alogoriza_task/ui/theme.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final  VoidCallback  onTap;
  Color color;

   MyButton({
    Key? key, required this.label,
    required this.onTap,
    this.color= Colors.white

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
        child: Center(
          child: Container(

            alignment: Alignment.center,
            width: 100,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent
            ),
            child: Text(
              label,
              style:  TextStyle(
                fontSize: 9,

                color: color,
                fontWeight: FontWeight.bold



              ),
              textAlign: TextAlign.center,


            ),




          ),
        ));
  }
}

class MyButton2 extends StatelessWidget {
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
  final double top;


  const MyButton2({

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
    this.top=0






  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left , bottom: bottom , right:right , top: top ),
      child: Container(
        width: width,

        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                radious
            )

        ),
        child: MaterialButton(
          onPressed: onClick,

          height: height,


          color: buttonColor,

          child:  Text(text ,style: TextStyle(color: textColor , fontSize: textSize)),











        ),
      ),
    );
  }
}
