
import 'package:flutter/cupertino.dart';
import 'package:level_one_project/models/Task.dart';
import 'package:level_one_project/models/users.dart';

class AppViewModel  extends ChangeNotifier{
  List<Tasks > task=<Tasks>[];
  Users user=Users ("kjkj");

  int get taskLength=>task.length;
  int get completed{
    return task.where((task) => task.done).length;
  }
  int get notCompleted{
    return task.where((task) => !task.done).length;
  }
  bool getTaskStatus(int index)=>task[index].done;
  String  TaskTitle(int index)=>task[index].taskName;
  ///////////
  void setTaskDone(int index,var value){
    task[index].done=value;
    notifyListeners();
  }
  void loginUser(String newUsername) {
    user.username = newUsername;
    notifyListeners();
  }

  void AddNewTask(Tasks newTask){
    task.add(newTask);
    print(newTask.taskName);
    notifyListeners();
  }
void updateTaskTitle(index,value){
    task[index].taskName=value;
    notifyListeners();
}
void DeleteTask(index){
    task.removeAt(index);
    notifyListeners();
}
}