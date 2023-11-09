import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ViewModel.dart';
import '../models/Task.dart';

class AlertshowDialog extends StatelessWidget {
  TextEditingController TextboxCnt = TextEditingController();
  String operation;
  var Taskindex;

  AlertshowDialog({required this.operation, this.Taskindex, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        title:
             Text('${this.operation} Task', style: TextStyle(color: Colors.cyan)),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Please Enter your task :'),
              //
              TextField(

                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 5),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none))),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                autofocus: true,
                autocorrect: false,
                controller: TextboxCnt,
                style: TextStyle(
                    color: Colors.grey[700], fontWeight: FontWeight.w500),
              ),

              //
            ],
          ),
        ),
        actions: [
          TextButton(
            child:  Text("${this.operation}",
                style: const TextStyle(
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            onPressed: () {
              if(TextboxCnt.text.isNotEmpty) {
                if (operation == "Add") {
                  Tasks newTask = Tasks(TextboxCnt.text, false);
                  viewModel.AddNewTask(newTask);
                  print(operation);
                } else {
                  viewModel.updateTaskTitle(Taskindex, TextboxCnt.text);
                }


              TextboxCnt.clear();
              Navigator.of(context).pop();
              }

            },
          ),
          TextButton(
            child: const Text("Cancel",
                style: TextStyle(
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }
}
