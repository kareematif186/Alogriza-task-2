import 'package:flutter/material.dart';

class Text1 extends StatelessWidget {
  final double ?width;
  final double ?height;
  final String text;
  final Color textColor;
  final double textSize;
  final FontWeight ?bold;
  final double bottom;
  final double left;
  final double right;





  const Text1({

    Key? key,
    this.width=20,
    this.height=100,
    required this.text,
    this.textColor=Colors.white,
    this.textSize=14,
    this.bold = FontWeight.bold,
    this.bottom=0,
    this.left=0,
    this.right=0








  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(

      padding: EdgeInsets.only( bottom: bottom  , left: left , right: right),
      child: SizedBox(
        height: height,

        child: Text(

            text,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: textSize , color: textColor , fontWeight: bold),




        ),
      ),
    );
  }
}
