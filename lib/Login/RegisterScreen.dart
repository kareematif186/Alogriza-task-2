import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:intl_phone_field/intl_phone_field.dart';



import 'SignInScreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:
     SingleChildScrollView(

       child: ListView(
         shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(),
         children:[
           Container(
           width: width,
           height: height * 0.15,
           child: Stack(
             fit: StackFit.expand,
             clipBehavior: Clip.none,
                children: [
                  Container(
                      width: width,
                      height: height * 0.20,
                      child: Image.asset('assets/img/notes.jpg', fit: BoxFit.fill,)),
           SizedBox(
             height: 115,
             width: 115,
             child: Stack(
               clipBehavior: Clip.none,
               fit: StackFit.expand,
               children: [

                 Positioned(
                     bottom: 30,
                     left: 10,
                     child: RawMaterialButton(
                       onPressed: () {   Navigator.of(context).push(
                           MaterialPageRoute(builder: (v) {
                             return SignInScreen();
                           }
                           )

                       );},
                       elevation: 1.0,

                       fillColor: Color(0x99000000,),
                       child: Align(
                           alignment: Alignment.center,
                           child: Container(
                               alignment: Alignment.center,
                               child: Icon(Icons.arrow_back_ios, color: Colors.white,))),
                       padding: EdgeInsets.all(8.0),
                       shape: CircleBorder(),
                     )
                 ),
               ],
             ),

           ),]

    ),
         ),

           Padding(
             padding: const EdgeInsets.all(15),
             child:
             ListView(
       //scrollDirection: Axis.vertical,
        shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
        //crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
        Text("Welcome to Fashion Daily",
        style: TextStyle(fontSize: 12, color: Colors.grey),),
        SizedBox(height: 15,),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text("Register",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight
            .bold),),
        Row(
        children: [
        Text("Help", style: TextStyle(
        fontSize: 12, color: Colors.blue),
        ),
        SizedBox(width: 5,),
        Icon(Icons.help, size: 15, color: Colors.blue,)
        ],
        ),

        ],
        ),
        SizedBox(height: 20,),

          Text("Email", style: TextStyle(fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w500),),
          SizedBox(height: 10,),


          Container(
            height: 50,
            child: TextFormField(


              keyboardType: TextInputType.visiblePassword,

              decoration: const InputDecoration(

                labelText: 'Eg. example@email.com',
                labelStyle: TextStyle(fontSize: 11),
                hintText: 'enter email',
                border: OutlineInputBorder(),


              ),
            ),
          ),
          SizedBox(height: 20,),
          Text("Phone Number", style: TextStyle(fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w500),),
          SizedBox(height: 10,),
          Container(
            height: 70,
            child: IntlPhoneField(

              showCountryFlag: false,
              decoration: InputDecoration(
                labelText: 'Eg.8342453878',
                labelStyle: TextStyle(fontSize: 11),
                border: OutlineInputBorder(
                borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'EG',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
          ),
         // SizedBox(height: 5,),
          Text("Password", style: TextStyle(fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w500),),
          SizedBox(height: 5,),

          Container(
            height: 50,
            child: TextFormField(

              keyboardType: TextInputType.visiblePassword,

              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle:  TextStyle(fontSize: 11),
                hintText: 'enter passward',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye_rounded,color: Colors.black,),
                onPressed: (){
                  setState(() {

                  });
                },
                ),

              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            height: 45,
            // alignment: Alignment.center,
            //width: double.infinity,
            //padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: ElevatedButton(



                child: Text("Register"),
                onPressed: (){}),
          ),
          SizedBox(height: 5,),

          Row(
              children: <Widget>[
              Expanded(
                  child: Divider(height: 40,)
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Or",style: TextStyle(color: Colors.grey , fontSize: 11),),
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
              decoration: new BoxDecoration(
              shape: BoxShape.circle,
              ),
              height: 45,
              child: SignInButton(

              Buttons.Google,
                padding:  const EdgeInsets.all(10),






              onPressed: () {},
              ),
            ),
          ),
          SizedBox(height: 10,),
       Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Has any account?" ,  style: TextStyle(fontSize: 11),),
              TextButton(onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (v) {
                    return SignInScreen();
                  }
                  )

              );
              }, child: Text("Sign In here" ,  style: TextStyle(fontSize: 11)))


            ],
          ),

          SizedBox(height: 10,),

        ]
         ),
           ),

    ],),
     ),
    );
  }
}
