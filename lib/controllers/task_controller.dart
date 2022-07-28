import 'package:alogoriza_task/db/db_helper.dart';
import 'package:get/get.dart';

import '../models/task.dart';

class TaskController extends GetxController {
final RxList<Task> taskList=<Task>[].obs;


Future<int> addTask({Task? task}){
  print('inserted');
return DBHelper.insert(task);



}

// get data from database
Future<void> getTasks() async {
final List<Map<String,dynamic>> tasks=await DBHelper.query();
taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
}


void deleteTasks(Task task)async{

  await DBHelper.delete(task);
  getTasks();


}

void markTaskCompleted(int id , int value)async{
  await DBHelper.update(id , value);
  getTasks();


}





}
