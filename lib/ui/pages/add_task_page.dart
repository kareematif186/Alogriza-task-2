import 'package:alogoriza_task/controllers/task_controller.dart';
import 'package:alogoriza_task/ui/theme.dart';
import 'package:alogoriza_task/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/task.dart';
import '../../services/notification_services.dart';
import '../widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  late DateTime _selectedDate = DateTime.now();
  late  String _startTime =
      DateFormat('hh:mm a').format(DateTime.now()).toString();
  late String _endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  int _selectedRemind = 5;
  List<int> remindList = [1, 5, 10, 15, 20];
  String _selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  late int _selectedColor = 0;
  late var notifyhelper;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyhelper= notifyHelper();
    notifyhelper.requestIOSPermissions();
    notifyhelper.initializeNotification();



  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _taskController.getTasks();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        leading:  Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            onPressed: ()=> Get.back(),
            icon: const Icon(Icons.arrow_back_ios , size: 17 ,),
            color: Get.isDarkMode? Colors.white : Colors.black,


          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 0),
          child: Text(
            "Add Task",
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),


        bottom: PreferredSize(
          preferredSize: const Size(400.0, 20),
          child: Column(children: [
            Text(
              "__________________________________________",
              style: TextStyle(color: Colors.grey.withOpacity(0.3)),
            ),
          ]),
        ),

    elevation: 0,
    backgroundColor: context.theme.backgroundColor,





    ),



      body: Container(

        padding: const EdgeInsets.only(left: 30 , right: 30),
        child: SingleChildScrollView(
          child: Column(

            children: [

              InputField(
                title: 'Title',
                hint: 'Enter title here',
                controller: _titleController,
              ),
              InputField(
                title: 'Note',
                hint: 'Enter note here',
                controller: _noteController,
              ),
              InputField(
                title: 'Deadline',
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  onPressed: () { _getDateFromUser();},
                  icon:  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: 'Start Time',
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () { _getTimeFromUser(isStartTime: true);  },
                        icon:  Icon(
                          Icons.access_time_filled_rounded,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: InputField(
                      title: 'End Time',
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () { _getTimeFromUser(isStartTime: false); },
                        icon:  Icon(
                          Icons.access_time_filled_rounded,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              InputField(
                  title: 'Remind',
                  hint: "$_selectedRemind minutes early",
                  widget: Row(
                    children: [
                      DropdownButton(
                        dropdownColor: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                        items: remindList
                            .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(
                                  '$value',
                                  style: const TextStyle(color: Colors.white),
                                )))
                            .toList(),
                        icon:  Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        iconSize: 32,
                        elevation: 4,
                        underline: Container(
                          height: 0,
                        ),
                        onChanged: (int? value) {
                          setState(() {
                            _selectedRemind = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 6,)
                    ],
                  )),
              InputField(
                  title: 'Repeat',
                  hint: _selectedRepeat,
                  widget: Row(
                    children: [
                      DropdownButton(
                        dropdownColor: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                        items: repeatList
                            .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(color: Colors.white),
                                )))
                            .toList(),
                        icon:  Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        iconSize: 32,
                        elevation: 4,
                        underline: Container(
                          height: 0,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _selectedRepeat = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 6,)
                    ],
                  )),
              const SizedBox(height: 0,),
              Column(
                children: [
                  Text('' , style: titleStyle,),
                  const SizedBox(height: 8,),
                  Wrap(
                    children:List.generate(4, (index) =>
                        GestureDetector(
                          onTap:(){
                            setState(() {

                              _selectedColor=index;


                            });


                          },
                          child:  Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CircleAvatar(
                              child: _selectedColor==index? const Icon(Icons.done,size: 16,color: Colors.white,):null,
                              backgroundColor: index==0? primaryClr :index==1 ?pinkClr :index==2?orangeClr :yellow,
                              radius: 14,

                            ),
                          ),
                        )
                    )


                  ),

                  MyButton2(text:'Add a Task',textSize: 12  ,radious: 15, height: 45 ,  width: 340 ,top: 20 ,buttonColor: green  ,onClick: () async {

                    _validateDate();

                    var date=DateFormat.jm().parse(_startTime);
                    var mytime=DateFormat("HH:mm ").format(date);




                    notifyHelper().scheduleNotification(int.parse(mytime.toString().split(':')[0]),
                        int.parse(mytime.toString().split(':')[1]),_selectedRemind,
                        _selectedRepeat,_selectedDate.toString(),_titleController.text);




                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _validateDate(){

    if(_titleController.text.isNotEmpty){
      _addTaskToDb();
      Get.back();


    }else if(_titleController.text.isEmpty ){

      debugPrint('enter something');

      Get.snackbar('required', '',
      snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: pinkClr,
        icon: const Icon(Icons.warning_amber_rounded , color: Colors.red,),

      );



    }


  }




_addTaskToDb()async {
    int value =await _taskController.addTask(

      task: Task(

        title: _titleController.text.toString(),
        note: _noteController.text.toString(),
        isCompleted: 0,
        date: DateFormat.yMd().format(_selectedDate),
        startTime:_startTime,
        endTime: _endTime,
        color: _selectedColor,
        remind: _selectedRemind,
        repeat: _selectedRepeat







      ),

    );



    print(value);



}

  void _getDateFromUser() async {

    DateTime? _pickedDate =await showDatePicker(context: context, initialDate: _selectedDate, firstDate: DateTime(2015), lastDate: DateTime(2030));

if(_pickedDate!=null) {
  setState(() {
    _selectedDate = _pickedDate;
  });
}
else print('');


  }



  Future<void> _getTimeFromUser({required bool isStartTime}) async {

    TimeOfDay? _pickedTime =await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,

        context: context, initialTime: isStartTime
        ? TimeOfDay.fromDateTime(DateTime.now())
        :TimeOfDay.fromDateTime(DateTime.now().add(const Duration(minutes:15)))
    );
    String _formattedTime= _pickedTime!.format(context);
    if(isStartTime){
      setState(() {
        _startTime=_formattedTime;
      });
    }

    else if(!isStartTime){

      setState(() {
        _endTime=_formattedTime;
      });
    }

       else{ print('time canceld or someething wrong');}




  }







}
