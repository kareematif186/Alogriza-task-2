import 'package:alogoriza_task/Login/RegisterScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class SignInScreen  extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    double dropdownButtonWidth = MediaQuery.of(context).size.width * 0.5;
    //respect dropdown button icon size
    double dropdownItemWidth = dropdownButtonWidth - 30;
    double dropdownSelectedItemWidth = dropdownButtonWidth - 30;
    return Scaffold(
      body:
      SafeArea(
        child: ListView(
          
         // mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
                width: width,
                height: 240,
                child: Image.asset('assets/img/notes.jpg', fit: BoxFit.fill,)),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  const Text("Welcome to Fashion Daily",
                    style: TextStyle(fontSize: 10, color: Colors.grey),),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Sign in",
                        style: TextStyle(fontSize: 25, ),),
                      Row(
                        children: const [
                          Text("Help", style: TextStyle(
                              fontSize: 12, color: Colors.blue),),
                          SizedBox(width: 5,),
                          Icon(Icons.help, size: 15, color: Colors.blue,)
                        ],
                      ),

                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Text("Phone Number", style: TextStyle(fontSize: 11,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),),
                  const SizedBox(height: 10,),


                  Container(
                    height: 70,
                    child: IntlPhoneField(
                      showCountryFlag: false,
                      decoration: const InputDecoration(
                        labelText: 'Eg.8342453878',
                        labelStyle:  TextStyle(fontSize: 11, color: Colors.grey , ),
                        counterStyle: TextStyle(fontSize: 11, color: Colors.grey , fontWeight: FontWeight.bold),
                        hintStyle:TextStyle(fontSize: 11, color: Colors.grey , fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'EG',
                      disableLengthCheck: false,

                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                   height: 50,
                     // alignment: Alignment.center,
                   //width: double.infinity,
                   //padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: ElevatedButton(


                        child: const Text("Sign in"),
                        onPressed: (){}),
                  ),
                  const SizedBox(height: 10,),

                  Row(
                      children: const <Widget>[
                        Expanded(
                            child: Divider(height: 40,)
                        ),

                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Or",style: TextStyle(fontSize: 11, color: Colors.grey , ),),
                        ),

                        Expanded(
                            child: Divider(height: 40,)
                        ),
                      ]
                  ),
                  Container(
                    //margin: const EdgeInsets.all(15.0),
                    //padding: const EdgeInsets.all(3.0),
                      width: double.infinity,
                      //height: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                      height: 50,
                      child: SignInButton(

                        Buttons.Google,

                       padding:  const EdgeInsets.all(10),

                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Text("Doesn't has any account?" , style: TextStyle(fontSize: 11, color: Colors.grey , fontWeight: FontWeight.bold),),
                   TextButton(onPressed: (){
                     Navigator.of(context).push(
                         MaterialPageRoute(builder: (v) {
                           return RegisterScreen();
                         }
                         )

                     );
                   }, child: const Text("Register here" ,style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold), ))


                 ],
               ),
                  const SizedBox(height: 10,),

                  Container(
                      padding: const EdgeInsets.all(15.0),

                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Text("Use the application according to policy rules.Any \n \n kind of vioalations will besubject to sanctions",
                          overflow: TextOverflow.clip,
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 9,color: Colors.grey),),
                      ),)
                ],


              ),

            )


          ],


        ),
      ),


    );
  }

  }


