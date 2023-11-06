import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:level_one_project/ViewModel.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:provider/provider.dart';
import 'appbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewmodel, child) {
        return Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(60), child: MyappBar()),
          body: SafeArea(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(
                      child: Text("Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22)),
                    ),
                    width: 300,
                    height: 60,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.cyan[50],
                              ),
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Nagwa Ibrahim Ahmed",
                                          style:
                                          TextStyle(fontWeight: FontWeight.bold)),
                                    ),

                                    Text("User Name ${viewmodel.user.username}",
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),

                      ProfilePhoto(
                        totalWidth: 175,
                        cornerRadius: 100,
                        color: Colors.cyan.shade50,
                        image: const AssetImage('images/profile.jpg'),
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(


                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.email), label: Text("nellyibrahim144@gmail.com")
                                    ,style: ElevatedButton.styleFrom(
                            primary: Colors.purple,) ),
                                ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.phone_android), label: Text("+2011-261-999-01"))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.cyan[50],
                              gradient: LinearGradient(
                                  begin: AlignmentDirectional.bottomStart,
                                  colors: [
                                    Colors.grey.shade300,
                                    Colors.white,
                                    Colors.cyan.shade100
                                  ])),
                          width: 500,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                                "43 years old. Mother of 3 children ,former PHP web developer"
                                    " Currently Flutter Developer ",
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold)),
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
