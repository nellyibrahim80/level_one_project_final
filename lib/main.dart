import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:level_one_project/ViewModel.dart';
import 'package:level_one_project/Views/login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'Views/scafold.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreenView(),
        '/login': (context) => MyLogin(),
        '/task-list': (context) => taskListView(),
      },
      //home: MyLogin()
    );
  }
}

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        centered: true,
        splash: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "images/task-icon-22.jpg",
                width: 400,
                height: 200,
              ),
              Text("To Do Task",
                  style: TextStyle(
                      color: Colors.cyan[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 32)),
              const Text("Welcome To ToDo Task Project",style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
        ),
        //disableNavigation: true,
        animationDuration: Duration(seconds:3),
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.fade,
        splashIconSize: 300,
        backgroundColor: Colors.white,
        nextScreen: MyLogin());
  }
}
