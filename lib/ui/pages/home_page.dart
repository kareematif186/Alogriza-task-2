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
import 'board.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late NotifyHelper notifyHelper;
  Timer? timer;

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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            onPressed: () => Get.back(),
            icon:  Icon(
              Icons.arrow_back_ios,
              size: 17,
              color:  Get.isDarkMode ?  Colors.white :  Colors.black,
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: Text(
            "Schedule",
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : darkGreyClr,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(400.0, 20),
          child: Column(children: [
            Text(
              "__________________________________________",
              style: TextStyle(color:Colors.grey.withOpacity(0.3)),
            ),
          ]),
        ),
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
      ),
      body: Column(
        children: [
          _addDateBar(),
          Text(
            "__________________________________________",
            style: TextStyle(color: Colors.grey.withOpacity(0.3)),
          ),
          _addTaskBar(),
          SizedBox(
            height: 18,
          ),
          _showTasks(),
        ],
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('EEEE').format(_selectedDate),
                style: subHeadingStyle,
              ),
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadingStyle2,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 25, bottom: 5),

      child: DatePicker(
        DateTime.now(),
        width: 63,
        height: 100,

        initialSelectedDate: _selectedDate,
        selectedTextColor: Colors.white,
        selectionColor: green,
        dateTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        )),
        dayTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        )),
        monthTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        )),
        onDateChange: (newDate) {
          setState(() {
            _selectedDate = newDate;
          });
        },
      ),
    );
  }

  Future<void> _onRefresh() async {
    _taskController.getTasks();
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        if (_taskController.taskList.isEmpty) {
          return _noTaskMsg();
        } else {
          return ListView.builder(
              padding: const EdgeInsets.only(top: 9 ),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                var task = _taskController.taskList[index];
                //deleteTaskfromDb(task);

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

                  return AnimationConfiguration.staggeredList(
                    duration: Duration(milliseconds: 0),
                    position: index,
                    child: SlideAnimation(
                      horizontalOffset: 300,
                      child: FadeInAnimation(
                        child: Column(
                          children: [
                            TaskTile(task: task),
                            SizedBox(height: 7,),
                          ],
                        ),
                      ),
                    ),
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
              itemCount: _taskController.taskList.length);
        }
      }),
    );
  }

  _noTaskMsg() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 2000),
          child: SingleChildScrollView(
              child: Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const SizedBox(
                height: 180,
              ),
              SvgPicture.asset(
                'assets/img/task.svg',
                color: green.withOpacity(0.5),
                height: 110,
                semanticsLabel: 'Task',
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'You do not have tasks yet!\n Add new tasks to make your days perfect',
                style: subtitleStyle,
                textAlign: TextAlign.center,
              ),
            ],
          )),
        )
      ],
    );
  }

  deleteTaskfromDb(Task task) async {
    _taskController.deleteTasks(task);
  }
}
