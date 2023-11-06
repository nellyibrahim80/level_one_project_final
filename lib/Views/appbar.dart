import 'package:flutter/material.dart';
import 'package:level_one_project/ViewModel.dart';
import 'package:level_one_project/Views/profile.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'info_sec.dart';

class MyappBar extends StatelessWidget {
  const MyappBar({super.key});
  Size get preferredSize => const Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewmodel, child) {
      return AppBar(
        backgroundColor: Colors.cyan,

        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  PageTransition(child: Profile(), type:PageTransitionType.fade,alignment: Alignment.bottomLeft ,duration:Duration(seconds: 1)));
            },
            icon:const Icon(
              Icons.person,
              size: 40,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/login");
              //Navigator.pop(context);
            },
            icon:const Icon(
              Icons.logout,
              size: 40,
            ),
          )
        ],

        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskInfo(),
                ));
          },
          icon: Icon(Icons.menu),
        ),
        title: Text("Welcome, ${viewmodel.user.username}"),
      );
    },);
  }
}
