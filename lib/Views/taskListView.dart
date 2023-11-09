import 'package:flutter/material.dart';
import 'package:level_one_project/ViewModel.dart';
import 'package:level_one_project/Views/AlertView.dart';
import 'package:provider/provider.dart';

import 'alertTwoButton.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewmodel, child) {
      return Container(

        child: ListView.separated(

          itemBuilder: (context, index) {

            return ListTile(

              leading: Checkbox(
                checkColor: Colors.cyan,
                activeColor: Colors.grey[200],

                side: const BorderSide(color: Colors.cyan),
                value: viewmodel.getTaskStatus(index),
                onChanged: (value){viewmodel.setTaskDone(index, value);},
              ),
              title: Text(viewmodel.TaskTitle(index),style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey[700] )),
              trailing:SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(icon: const Icon(Icons.delete),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>confirm(Taskindex: index)));},),
                    IconButton(icon: const Icon(Icons.edit_note),onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AlertshowDialog(operation: "Update",Taskindex: index)));
                    },),
                  ],
                ),
              ) ,);

          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10,);
          },
          itemCount: viewmodel.taskLength),);
    },);
  }
}
