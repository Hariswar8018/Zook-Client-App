import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:zook/login/login.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body:OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Register',
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Colors.black,
        ),
        skipTextButton: Text('Skip'),
        trailing: Text('Login'),
        trailingFunction: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        },
        onFinish: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        },
        background: [
          Container(
            width: w,
            height: w,
            color: Colors.white,
          ),
          Container(
            width: w,
            height: w,
            color: Colors.white,
          ),Container(
            width: w,
            height: w,
            color: Colors.white,
          ),

        ],
        totalPage: 3,indicatorAbove: true,
        speed: 1.8,pageBackgroundColor: Colors.white,
        pageBodies: [
          con(w, "assets/shopping.jpg", "Welcome to ZOOK!", "Start selling smarter with ZOOK. Join our trusted seller network and grow your business with powerful tools and real-time insights."),
          con(w, "assets/profit.png", "Set Up Your Store in Minutes", "Easy and fast onboarding. Add your products, set prices, and you’re ready to reach thousands of customers on ZOOK."),
          con(w, "assets/profit2.jpg", "Manage. Sell. Grow.", "From inventory to orders, ZOOK gives you full control to manage your business and scale with ease. Let’s get started!"),
        ],
      ),
    );
  }
  Widget con(double w ,String asset,String title,String desc) {
    return Container(
      width: w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(asset,width: w,),
          SizedBox(height: 20,),
          Text(title,style: TextStyle(fontWeight: FontWeight.w900,fontSize: 21),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 4),
            child: Text(desc,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
