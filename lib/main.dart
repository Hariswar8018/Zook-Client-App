import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart' show Amplify;
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart' hide Amplify;
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zook/login/login.dart';
import 'package:zook/navigation/check.dart';
import 'package:zook/main.dart' as np;

import 'amplifyconfiguration.dart';
import 'login/onboarding.dart';
import 'package:flutter/material.dart';

import 'models/ModelProvider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final apiPlugin = AmplifyAPI(options: APIPluginOptions(
    modelProvider: ModelProvider.instance
  ));
  final storage = AmplifyStorageS3();
  final auth = AmplifyAuthCognito();
  await Amplify.addPlugins([apiPlugin,auth,storage]);
  await Amplify.configure(amplifyconfig);
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zook Client',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title,this.email=""});

  final String title, email;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  void initState(){
      Timer(Duration(seconds: 3),(){
        check();
      });
  }

  void getemail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String email= await prefs.getString("email")??"";
    print(email);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SellerCheckScreen(email:email )));

  }

  void check() async{
    final result = await Amplify.Auth.fetchAuthSession();
    print(result);
    if(result.isSignedIn){
      final user = await Amplify.Auth.getCurrentUser();
      final username = user.username;
      getemail();
       return ;
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Onboarding()));
  }

  StoragePath paths(String s)=>StoragePath.fromString('public/$s');

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