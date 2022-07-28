import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key , required this.payload}) : super(key: key);

  final String payload;

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payload='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _payload=widget.payload;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=> Get.back(),
          icon: const Icon(Icons.arrow_back_ios),



        ),
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        title: Text(_payload.toString().split('|')[0] ,style: const TextStyle(color: darkGreyClr),),



      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height:20),
            Column(
              children: [
               Text('Hellow Kareem' , style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold ,
               color: Get.isDarkMode? Colors.grey[100]: darkGreyClr
               ),),

                const SizedBox(height:10),

                Text('you have new reminder' , style: TextStyle(fontSize: 28,
                    color: Get.isDarkMode? Colors.grey[100]: darkGreyClr
                ),),










              ],
            ),
            const SizedBox(height:10),
            Expanded(child:Container(

              padding: const EdgeInsets.symmetric(vertical: 30 , horizontal: 30),
              margin: const EdgeInsets.symmetric(vertical: 30 , horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: primaryClr,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(),
                    const SizedBox(height:20),
                    const Text(""),
                    const SizedBox(height:20),
                    Row(),
                    const SizedBox(height:20),
                    const Text(""),
                    const SizedBox(height:20),
                    Row(),
                    const SizedBox(height:20),
                    const Text(""),



                  ],


                ),
              ),



            )),
            const SizedBox(height:10),
          ],
        ),
      ),
    );
  }
}
