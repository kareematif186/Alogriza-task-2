//import 'package:alogoriza_task/Login/my_button.dart';
import 'dart:async';

import 'package:alogoriza_task/controllers/task_controller.dart';
import 'package:alogoriza_task/services/notification_services.dart';
import 'package:alogoriza_task/services/theme_services.dart';
import 'package:alogoriza_task/ui/pages/add_task_page.dart';
//import 'package:alogoriza_task/ui/pages/notification_screen.dart';
import 'package:alogoriza_task/ui/theme.dart';
import 'package:alogoriza_task/ui/widgets/button.dart';
import 'package:alogoriza_task/ui/widgets/task_tile.dart';
//import 'package:alogoriza_task/ui/widgets/input_field.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../models/task.dart';
import '../size_config.dart';
import 'home_page.dart';
import 'package:unicons/unicons.dart';


class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  //late NotifyHelper notifyHelper;
  Timer? timer;
  Color colorBlack = Colors.black;
  Color colorWhite = Colors.white;
  bool value = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //notifyHelper =NotifyHelper();

    //notifyHelper.intializationNotification();

    _onRefresh();
  }

  final TaskController _taskController = Get.put(TaskController());
  DateTime _selectedDate = DateTime.now();
  TabController? _TabbarController;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0.0,
            leading: IconButton(
              onPressed: () {
                ThemeServices().switchTheme();
                //notifyHelper.displayNotification(title: "theme changed", body: "hi");
                // notifyHelper.scheduledNotification();
              },
              icon: Icon(
                Get.isDarkMode
                    ? Icons.wb_sunny_outlined
                    : Icons.nightlight_round_outlined,
                color: Get.isDarkMode ? Colors.white : darkGreyClr,
                size: 20,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Text(
                "Board",
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size(100.0, 80),
              child: Column(children: [
                Text(
                  "__________________________________________",
                  style: TextStyle(color: Colors.grey.withOpacity(0.3)),
                ),
                Column(
                  children: [



                    Row( children: [
                      Container(
                        padding: const EdgeInsets.only(left: 2),
                        child: SingleChildScrollView (
                          scrollDirection: Axis.horizontal,
                          child: DecoratedBox(
                            decoration: BoxDecoration(

                              border: Border(
                                bottom: BorderSide(color: Colors.grey.withOpacity(0.3),width: 1)

                              ),

                            ),
                            child: TabBar(
                              controller: _TabbarController,
                              indicatorColor:
                                  Get.isDarkMode ? Colors.white : darkGreyClr,
                              isScrollable: true,

                              indicatorSize: TabBarIndicatorSize.label,
                              unselectedLabelColor: Colors.grey,
                              labelColor: Get.isDarkMode ? Colors.white : darkGreyClr,
                              //labelPadding: EdgeInsets.only(bottom: 2),
                              indicatorWeight: 4,

                              onTap: (value) => colorWhite = colorBlack,

                              tabs: const [
                                SizedBox(
                                  width: 30,
                                  height: 65,
                                  child: Tab(
                                      child: Text(
                                    "All",
                                    style: TextStyle(fontSize: 10),
                                  )),
                                ),
                                SizedBox(
                                  width: 69,
                                  child: Tab(
                                      child: Text(
                                    "Completed",
                                    style: TextStyle(fontSize: 10),
                                  )),
                                ),
                                SizedBox(
                                  width: 90,
                                  child: Tab(
                                      child: Text(
                                    "Uncompleted",
                                    style: TextStyle(fontSize: 10),
                                  )),
                                ),
                                SizedBox(
                                  width: 55,
                                  child: Tab(
                                      child: Text(
                                    "Favorite",
                                    style: TextStyle(fontSize: 10),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),

                    ]),
                  ],
                )
              ]),
            ),
            elevation: 0,
            backgroundColor: context.theme.backgroundColor,
            actions: [
              Icon(
                UniconsLine.search,
                size: 23,
                color: Get.isDarkMode ? Colors.white : darkGreyClr,
              ),
              const SizedBox(
                width: 7,
              ),
              IconButton(
                onPressed: () async {

                  await Get.to(()=> const HomePage());


                },
               icon: Icon(
                  Icons.notifications,
                  size: 23,
                  color: Get.isDarkMode ? Colors.white : darkGreyClr,

                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Icon(UniconsLine.list_ul,
                  size: 25, color: Get.isDarkMode ? Colors.white : darkGreyClr),
              const SizedBox(
                width: 25,
              ),

              //Icon(Icons.sea)
            ],
          ),
          body: TabBarView(controller: _TabbarController, children:  [



            _showTasks(),
            _forcompleted(1),
            _forcompleted(0),
            _showTasks(),




          ]),
        ));
  }





  Future<void> _onRefresh() async {
    _taskController.getTasks();
  }

  _showTasks() {
    return Obx(() {
      if (_taskController.taskList.isEmpty) {
        return _noTaskMsg();
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 9),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      var task = _taskController.taskList[index];
                      //_deleteTaskfromDb(task);

                      if (task.date == DateFormat.yMd().format(_selectedDate) ||
                          task.repeat == 'Daily') {
                        //var hour = task.startTime.toString().split(':')[0];
                        //var minutes = task.startTime.toString().split(':')[1];

                        var date = DateFormat.jm().parse(task.startTime!);
                        var startime = DateFormat('hh:mm').format(date);
                        //var datenow=DateTime.now();

                        var datenow = DateFormat('hh:mm').format(DateTime.now());

                        var format = DateFormat("HH:mm");

                        var start = format.parse(startime);
                        var end = format.parse(datenow);

                        Duration diff = start.difference(end);
                        final hours = diff.inHours;
                        final minutes = diff.inMinutes;

                        print('$hours hours $minutes minutes');

                        var total = hours * 60 + minutes;
                        print(total);

                        if ((hours == 0 && minutes >= 5) || hours > 0) {
                          var m = total - task.remind!;
                          print(m);

                          //print(m);
                          print(hours);
                          /*
                        timer = Timer.periodic(
                            Duration( hours: 0, seconds: m), (
                            Timer t) =>
                            notifyHelper.displayNotification(title: task.title!,
                                body: task.note!));

                         */

                          Timer(Duration(minutes: m), () {
                            //notifyHelper.displayNotification(title: task.title!, body:task.note!);
                          });
                        }

                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [



                                Container(
                                    padding: const EdgeInsets.only(
                                      left: 12,
                                    ),
                                    child: Transform.scale(
                                      scale: 1.4,
                                      child: Checkbox(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.padded,
                                        visualDensity: VisualDensity.standard,
                                        checkColor: Get.isDarkMode
                                            ? darkGreyClr
                                            : Colors.white,

                                        activeColor: _getBGClr(task.color),
                                        side:
                                            BorderSide(color: _getBGClr(task.color)),

                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6)),
                                        value:
                                            task.isCompleted==1, //appCubit.get(context).isChecked![widget.index!],
                                        onChanged: (value2) {
                                          setState(() {
                                            int i;
                                            if( value2==true)
                                            {i=1;}
                                            else
                                            {
                                              i=0;
                                            }

                                            task.isCompleted=i;

                                             _taskController.markTaskCompleted(i,task.id!);

                                             print("sdxasdasdasdasdasdasdasd");
                                             print(task.isCompleted);







                                          });

                                        },
                                      ),
                                    )),
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  task.title.toString(),
                                  style: TextStyle(
                                    fontSize:12,
                                    color:
                                        Get.isDarkMode ? Colors.white : darkGreyClr.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),



                          ],
                        );
                      } else {
                        return Container();
                      }

                      // Task(
                      //
                      //   title: 'Title 1',
                      //   note: 'Note something',
                      //   isCompleted: 0,
                      //
                      //   startTime: '8:18',
                      //   endTime: '2:40',
                      //   color: 1,
                      //
                      //
                      // ),
                    },
                    itemCount: _taskController.taskList.length),
              ),
            ),

            MyButton2(text:'Add a Task',textSize: 12  ,radious: 15, height: 45 ,  width: 315 ,bottom: 30 ,buttonColor: green  ,onClick: () async {

              await Get.to(()=> const AddTaskPage());



            }),
          ],
        );
      }
    });
  }

  _noTaskMsg() {

    return Stack(

      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 2000),






          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  //mainAxisAlignment: .c,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const SizedBox(height: 180,),


                        SvgPicture.asset('assets/img/task.svg',

                          color: green.withOpacity(0.5),
                          height: 110,
                          semanticsLabel: 'Task',

                        ),


                        const SizedBox(height: 20,),
                        Text('You do not have tasks yet!\n Add new tasks to make your days perfect',
                          style: subtitleStyle,
                          textAlign:TextAlign.center ,

                        ),






                      ],


                    ),

                    SizedBox(height: 180,),
                    MyButton2(text:'Add a Task',textSize: 12  ,radious: 15, height: 45 ,  width: 340 ,bottom: 45 ,buttonColor: green  ,onClick: () async {

                      await Get.to(()=> const AddTaskPage());



                    }),

                  ],
                ),
              )


          ),

        )



      ],


    );



  }


  _deleteTaskfromDb(Task task) async {
    _taskController.deleteTasks(task);
  }

  _getBGClr(int? color) {
    switch (color) {
      case 0:
        return bluishClr;
      case 1:
        return pinkClr;
      case 2:
        return orangeClr;
      case 3:
        return yellow;
    }
  }





  Widget _forcompleted(int completed){

    return Obx(() {
      if (_taskController.taskList.isEmpty) {
        return _noTaskMsg();
      } else {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView.builder(
              padding: const EdgeInsets.only(top: 9),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                var task = _taskController.taskList[index];
                //_deleteTaskfromDb(task);

                if ((task.date == DateFormat.yMd().format(_selectedDate) ||
                    task.repeat == 'Daily') && task.isCompleted==completed) {



                  //var hour = task.startTime.toString().split(':')[0];
                  //var minutes = task.startTime.toString().split(':')[1];

                  var date = DateFormat.jm().parse(task.startTime!);
                  var startime = DateFormat('hh:mm').format(date);
                  //var datenow=DateTime.now();

                  var datenow = DateFormat('hh:mm').format(DateTime.now());

                  var format = DateFormat("HH:mm");

                  var start = format.parse(startime);
                  var end = format.parse(datenow);

                  Duration diff = start.difference(end);
                  final hours = diff.inHours;
                  final minutes = diff.inMinutes;

                  print('$hours hours $minutes minutes');

                  var total = hours * 60 + minutes;
                  print(total);

                  if ((hours == 0 && minutes >= 5) || hours > 0) {
                    var m = total - task.remind!;
                    print(m);

                    //print(m);
                    print(hours);
                    /*
                  timer = Timer.periodic(
                      Duration( hours: 0, seconds: m), (
                      Timer t) =>
                      notifyHelper.displayNotification(title: task.title!,
                          body: task.note!));

                   */

                    Timer(Duration(minutes: m), () {
                      //notifyHelper.displayNotification(title: task.title!, body:task.note!);
                    });
                  }

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [



                          Container(
                              padding: const EdgeInsets.only(
                                left: 12,
                              ),
                              child: Transform.scale(
                                scale: 1.4,
                                child: Checkbox(
                                  materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                                  visualDensity: VisualDensity.standard,
                                  checkColor: Get.isDarkMode
                                      ? darkGreyClr
                                      : Colors.white,

                                  activeColor: _getBGClr(task.color),
                                  side:
                                  BorderSide(color: _getBGClr(task.color)),

                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  value:
                                  task.isCompleted==1, //appCubit.get(context).isChecked![widget.index!],
                                  onChanged: (value2) {
                                    setState(() {
                                      int i;
                                      if( value2==true)
                                      {i=1;}
                                      else
                                      {
                                        i=0;
                                      }

                                      task.isCompleted=i;

                                      _taskController.markTaskCompleted(i,task.id!);

                                      print("sdxasdasdasdasdasdasdasd");
                                      print(task.isCompleted);







                                    });

                                  },
                                ),
                              )),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            task.title.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color:
                              Get.isDarkMode ? Colors.white : darkGreyClr,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  );
                } else {
                  return Container();
                }

                // Task(
                //
                //   title: 'Title 1',
                //   note: 'Note something',
                //   isCompleted: 0,
                //
                //   startTime: '8:18',
                //   endTime: '2:40',
                //   color: 1,
                //
                //
                // ),
              },
              itemCount: _taskController.taskList.length),
        );
      }
    });


  }
}
