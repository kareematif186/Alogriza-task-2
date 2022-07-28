import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF42a0ff);
const Color orangeClr = Color(0xFFff9d42);
const Color yellow = Color(0xFFf9c50b);
const Color pinkClr = Color(0xFFff5147);
const Color green   =Color(0xff25c06d);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes {

  static final light = ThemeData(
  primaryColor: primaryClr,
  backgroundColor: Colors.white,
  brightness: Brightness.light

  );
  static final dark = ThemeData(
      primaryColor: darkGreyClr,
      backgroundColor: darkGreyClr,
      brightness: Brightness.dark

  );



}




TextStyle get bodyStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
        color: Get.isDarkMode ? Colors.white : Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      )


  );
}

TextStyle get body2Style{
  return GoogleFonts.lato(
      textStyle: TextStyle(
        color: Get.isDarkMode ? Colors.grey[200] : darkGreyClr,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      )


  );
}


TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
        color: Get.isDarkMode ? Colors.grey[100] : darkGreyClr,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      )


  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
        color: Get.isDarkMode ? Colors.grey[100] : darkGreyClr,
        fontSize: 11,
        fontWeight: FontWeight.bold,
      )


  );
}

TextStyle get subHeadingStyle2 {
  return GoogleFonts.lato(
      textStyle: TextStyle(
        color: Get.isDarkMode ?  Colors.grey :  Colors.grey,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      )


  );
}







TextStyle get titleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
        color: Get.isDarkMode ? Colors.grey[100] : darkGreyClr,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      )


  );
}

TextStyle get subtitleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
        color: Get.isDarkMode ? Colors.grey[100] :  Colors.grey[500],
        fontSize: 9,
        fontWeight: FontWeight.w400,
      )


  );
}