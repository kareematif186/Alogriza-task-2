import 'package:alogoriza_task/ui/size_config.dart';
import 'package:alogoriza_task/ui/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/task_controller.dart';
import '../../models/task.dart';
import 'button.dart';

class TaskTile extends StatefulWidget {
   TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  final TaskController _taskController2 =Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      height: 93,
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(22),vertical:getProportionateScreenWidth(0) ),
      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(5)),
      child: Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: _getBGClr(widget.task.color),
        ),
        child: Row(
          children: [
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.task.startTime}-${widget.task.endTime}',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: Colors.grey[100],
                                fontSize: 9,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.task.title!,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.task.note!,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      color: Colors.grey[100],
                      fontSize: 15,
                    )),
                  )
                ],
              ),
            )),
            Transform.scale(
              scale: 1.3,
              child: Checkbox(
                checkColor: Colors.white,

                activeColor: Colors.transparent,
                hoverColor: Colors.white,


                side: const BorderSide(color: Colors.white),

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                value: widget.task.isCompleted == 1,


                //appCubit.get(context).isChecked![widget.index!],
                onChanged: (value) {

                  setState(() {
                    int i;
                    if( value==true)
                    {i=1;}
                    else
                    {
                      i=0;
                    }

                    widget.task.isCompleted=i;

                    _taskController2.markTaskCompleted(i,widget.task.id!);

                    print("sdxasdasdasdasdasdasdasd");
                    print(widget.task.isCompleted);


                  });



                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              width: 0.5,
              color: Colors.grey[200]!.withOpacity(0.7),
            ),

            RotatedBox(
              quarterTurns: 4,
              child: Column(
                children: [
                  MyButton(label:'Delete', onTap: () async {

                    deleteTaskfromDb2(widget.task);




                  }),
                  MyButton(label:'Edit',color: Colors.white , onTap: () async {

                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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

  void deleteTaskfromDb2(Task task) {
    _taskController2.deleteTasks(task);


  }
}
