import 'package:flutter/material.dart';
import 'package:zook/Global/others.dart';
import 'package:zook/navigation/home.dart';
import 'package:zook/navigation/naviagtion.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Global.white,
      body: SingleChildScrollView(
        child: Container(
          width: w,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Image.asset("assets/logo_full.jpg",width: w/4,),
              Center(child: Text("Login Now",style: TextStyle(color: Global.blue,fontSize: 27,fontWeight: FontWeight.w800),)),
              SizedBox(height: 4,),
              Text("Welcome Back !",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
              Text("You have been Missed",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width : MediaQuery.of(context).size.width  , height : 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100, // Background color of the container
                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only( left :10, right : 18.0),
                      child: TextFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          isDense: true,
                          border: InputBorder.none, // No border
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width : MediaQuery.of(context).size.width  , height : 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100, // Background color of the container
                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only( left :10, right : 18.0),
                      child: TextFormField(
                        controller:pass,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          isDense: true,
                          border: InputBorder.none, // No border
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>Navigation()));
                },
                child: Container(
                  width: w-15,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Global.blue,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  child: Center(child: Text("Sign In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),)),
                ),
              ),
              Spacer(),
              Text("or continue with",style: TextStyle(fontSize: 15,color: Global.blue,fontWeight: FontWeight.w500),),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  con(w, "assets/apple.png"),
                  con(w, "assets/facebook.png"),
                  con(w, "assets/google.webp"),
                ],
              ),
              SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController email = TextEditingController();
  TextEditingController pass=TextEditingController();

  Widget con(double w,String assetlink)=>Container(
    width: w/5,
    height: w/10,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      border: Border.all(
        color: Colors.grey.shade200,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5), // Color of the shadow
          offset: Offset(0, 5), // x, y offset of the shadow
          blurRadius: 10, // How blurry the shadow edges are
          spreadRadius: 1, // How much the shadow expands
        ),
      ]
    ),
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(assetlink),fit: BoxFit.contain),
        ),
      ),
    ),
  );
}
