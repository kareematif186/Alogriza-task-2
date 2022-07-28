import 'package:alogoriza_task/ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.title,
    this.widget,
    this.controller,
    required this.hint,
  }) : super(key: key);

  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: titleStyle,),


          Container(


              padding: const EdgeInsets.only(left: 14),
              margin: const EdgeInsets.only(top: 8),
              height: 48,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color:   Get.isDarkMode ? Colors.black.withOpacity(0.8): Colors.grey[100]!,
                ),
                color: Get.isDarkMode ? Colors.black.withOpacity(0.1): Colors.grey[100],
              ),
              child: Row(
                children: [
                  Expanded(child: TextFormField(



                    controller: controller,
                    autofocus: false,
                    cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.green,
                    readOnly: widget!=null? true:false,
                    style: subtitleStyle,
                    decoration: InputDecoration(
                      filled: false, //<-- SEE HERE
                      fillColor: Get.isDarkMode ? Colors.black.withOpacity(0.8): Colors.grey[100],
                      hintText: hint,
                      hintStyle: subtitleStyle,
                      enabledBorder: UnderlineInputBorder(

                        borderSide: BorderSide(
                         color: Get.isDarkMode ? Colors.black.withOpacity(0.8): Colors.grey[100]!,
                          width: 0
                        )
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color:  Get.isDarkMode ? Colors.black.withOpacity(0.8): Colors.grey[100]!,
                            width: 0
                          )
                      ),


                    ),

                  )
                  ),

                  widget?? Container(),

                ],
              ),






          ),

        ],
      ),
    );
  }
}
