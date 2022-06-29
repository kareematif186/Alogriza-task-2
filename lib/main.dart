import 'package:alogoriza_task/my_button.dart';
import 'package:alogoriza_task/slide_item.dart';
import 'package:alogoriza_task/text1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Login/SignInScreen.dart';
import 'imgs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:SignInScreen(),


      //MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {






  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  //final controller =PageController();
  final PageController controller= PageController(
    initialPage: 0
  );



  var text = RichText(
    text: const TextSpan(
      // Note: Styles for TextSpans must be explicitly defined.
      // Child text spans will inherit styles from parent
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(text: "Don't have an account?" , style: TextStyle(fontWeight: FontWeight.bold   , color: Colors.black ) ),
        TextSpan(text: '  Sign up', style: TextStyle(fontWeight: FontWeight.bold   , color: Colors.teal )),
      ],
    ),
  );



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,


      body:  Padding(

        padding: const EdgeInsets.all(20.0),


        child: Stack(

          children:[

            SizedBox(height: 50,),

            PageView(

            children: const [
              Slide_item( url1: 'assets/img/delivery1.png',    text1: "    Get food delivery to your \n   door step asap",  text2: "We have young and professional delivery team that will bring your food as soon as possible to your doorstep",),

              Slide_item( url1: 'assets/img/delivery2.png', text1: "    Buy Any Food from your \n favourite restaurant ", text2: "we are constantly adding ypur favourite restaurant throughout the territory and around your carefully selected",),

            ],

          ),



            Container(
              padding: const EdgeInsets.only(top: 30.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: My_button(text: "Skip", onClick: (){} , height: 50, radious: 50, textColor: Colors.black, buttonColor: Colors.lime.shade50, width: null, textSize: 9, left: 5, bottom: 20,)),
            ),

            //Colors.blueGrey.shade50



            Container(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: const [
                  Imgs(url: 'assets/img/7Krave.jpg', height: 60 ,width: 200,),
                ],
              ),
            ),



            Padding(
              padding: const EdgeInsets.only(top: 590.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,


                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    width: 25,
                    height: 8,
                    margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.amber,
                      borderRadius:  BorderRadius.circular(
                        15
                    ),

                    ),

                  ),

                  Container(

                    width: 25,
                    height: 8,
                    margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 1),
                    decoration:  BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.blueGrey.shade100,
                        borderRadius:  BorderRadius.circular(
                        15
                    ),

                    ),

                  ),
                  Container(

                    width: 25,
                    height: 8,
                    margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
                    decoration:  BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.blueGrey.shade100,
                        borderRadius:  BorderRadius.circular(
                          15
                      ),

                    ),

                  ),
                ],
              ),
            ),





            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [

            My_button(text: "Get Started", onClick: (){} , height: 60, radious: 15, textColor: Colors.white, buttonColor: Colors.teal.shade300 , ),

             const SizedBox(height: 20,),

             Padding(padding: const EdgeInsets.only(bottom: 20), child: Container( width: double.infinity,  child: Center(child: text),),)


              ],
            ),
          ]
        ),
      ),



    );
  }
}

/*
PageView(

children: [
Container(
color: Colors.red,
child: Text("hi"),
),

Container(
color: Colors.black,
child: Text("hi2"),
),

Container(
color: Colors.blue,
child: Text("hi3"),
)


],

),
*/


/*
            My_button(text: "Skip", onClick: (){} , height: 50, radious: 50, textColor: Colors.black, buttonColor: Colors.lime.shade50, width: null, textSize: 9, left: 5, bottom: 20,),

            //Colors.blueGrey.shade50

            const Imgs(url: 'assets/img/7Krave.jpg', height: 60 ,width: 200,),

            const Imgs(url: 'assets/img/delivery1.png', height: 300 ,width: null,),

            const Text1(text: "Get food delivery to your \n door step asap", height: 60, textSize: 18, textColor: Colors.black, bottom: 15, right:27, left: 0,),

            const Text1(text:"We have young and professional delivery team that will bring your food as soon as possible to your doorstep", height: 100, textSize: 11, textColor: Colors.black38, bottom: 0, right:10, left: 10, bold: null,),








            My_button(text: "Get Started", onClick: (){} , height: 60, radious: 15, textColor: Colors.white, buttonColor: Colors.teal.shade400 , ),

            const SizedBox(height: 20,),

            Padding(padding: const EdgeInsets.only(bottom: 20), child: Container( width: double.infinity,  child: Center(child: text),),)

 */
