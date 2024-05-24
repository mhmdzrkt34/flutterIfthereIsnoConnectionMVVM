import 'package:cleanarchitectureandrepopattern/model_views/home_model_view.dart';
import 'package:cleanarchitectureandrepopattern/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {

  GetIt.instance.registerSingleton<HomeModelView>(HomeModelView());



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return MaterialApp(


      title: "advanced",

      initialRoute: "home",

      routes: {


        "home":(context)=>HomeView()
      },


      
    );

  }
}