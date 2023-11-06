import 'package:flutter/material.dart';
import 'package:level_one_project/ViewModel.dart';
import 'package:level_one_project/Views/scafold.dart';
import 'package:level_one_project/models/users.dart';
import 'package:provider/provider.dart';


class MyLogin extends StatelessWidget {
  var userData = TextEditingController();
  var passData = TextEditingController();
   MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewmodel, child) {

      return SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
              width: 200,
              //color: Colors.cyan,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("To Do Task",style:
                  TextStyle(color: Colors.cyan[700],fontWeight: FontWeight.bold,fontSize: 32)),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset("images/task-icon-22.jpg",height: 100),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: userData,
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    autofocus: true,
                    autocorrect: false,
                    decoration: InputDecoration(
                     labelText: "Username",

                        contentPadding: EdgeInsets.only(bottom: 5),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none))),

                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: passData,
                    decoration: InputDecoration(
                        labelText: "Password",

                        contentPadding: EdgeInsets.only(bottom: 5),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none))),
                    obscureText: true,
                  ),
                  ElevatedButton(

                      onPressed: () {
                        // viewmodel.user= new Users(userData.text);
                        viewmodel.loginUser(userData.text);

                         Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  taskListView(
                                  ),
                            )
                        );
                        userData.clear();
                        passData.clear();
                      },
                      child: const Text("Login"),
                    style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.cyan))   ),

                ],
              ),
            ),
          ),
        ),
      );
    },);
  }
}