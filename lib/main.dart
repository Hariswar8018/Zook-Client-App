import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart' show Amplify;
import 'package:flutter/material.dart';
import 'package:zook/login/login.dart';

import 'login/onboarding.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Amplify.addPlugins([AmplifyAuthCognito()]);

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