import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zook/login/login.dart';

import 'login/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zook',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  void initState(){
      Timer(Duration(seconds: 3),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Onboarding()));
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 110,),
          Spacer(),
          Center(child: Image.asset("assets/logo_full.jpg",width: MediaQuery.of(context).size.width,)),
          Spacer(),
          Image.asset("assets/security.png",height: 30,),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text("Trusted by",style: TextStyle(color: Colors.black,fontSize: 17),),
          ),
          Text("70,000+ Business Owners",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w800),),
          SizedBox(height: 50,),
        ],
      ),
    );
  }
}