import 'package:flutter/material.dart';
import 'package:level_one_project/ViewModel.dart';
import 'package:provider/provider.dart';

import 'appbar.dart';

class TaskInfo extends StatelessWidget {
  const TaskInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewmodel, child) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60), child: MyappBar()),
          body: SafeArea(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 25),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(40)),
                          child: Center(
                            child: Text("To Do Dashboard",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                          ),
                          width: 300,
                          height: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset("images/task-icon-22.jpg",
                              height: 100),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.cyan[50],),
                      width: 130,
                      height: 100,

                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text("Total Tasks",style: TextStyle(color: Colors.grey[700],fontWeight:FontWeight.bold )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${viewmodel.taskLength}"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.cyan[50],),
                          width: 150,
                          height: 100,

                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text("Completed Tasks",style: TextStyle(color: Colors.grey[700],fontWeight:FontWeight.bold )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("${viewmodel.completed}"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.cyan[50],),
                          width: 200,
                          height: 100,

                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text("Non-Completed Tasks",style: TextStyle(color: Colors.grey[700],fontWeight:FontWeight.bold )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("${viewmodel.notCompleted}"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(

              onPressed: () {
               // Navigator.pop(context);
                Navigator.pushNamed(context, '/task-list');
              },
              child: Text("Back"),
              backgroundColor: Colors.cyan),
        );
      },
    );
  }
}
