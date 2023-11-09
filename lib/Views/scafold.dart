import 'package:flutter/material.dart';
import 'package:level_one_project/ViewModel.dart';
import 'package:level_one_project/Views/AlertView.dart';
import 'package:level_one_project/Views/appbar.dart';
import 'package:level_one_project/Views/info_sec.dart';
import 'package:level_one_project/Views/taskListView.dart';
import 'package:provider/provider.dart';

class taskListView extends StatelessWidget {
  var userD;
  var tasktitle = TextEditingController();
  taskListView({this.userD, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewmodel, child) {
      return Scaffold(
        appBar: PreferredSize(preferredSize: const Size.fromHeight(60),
            child: MyappBar()),

        floatingActionButton: Container(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
                backgroundColor: Colors.cyan,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AlertshowDialog(
                                operation: "Add",
                              )));
                  /*showDialog(context: context, builder: (context) {
                   return AlertDialog(
                     title: Text("Task Title"),
                     content: Text("Please Enter the Task Title :" ),
                     actions: [
                       TextField(onSubmitted:(value){
                         viewmodel.addNewTask(tasktitle.text);
                         Navigator.pop(context);
                         },controller: tasktitle,
                           decoration: InputDecoration(filled: true,)),
                       ],

                   );
                 },);*/
                },
                child: Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.white,
                ))),
        body: TaskListView(),
      );
    });
  }
}
