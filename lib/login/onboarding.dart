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
          con(w, "assets/shopping.jpg", "Turn your Shopping Online", "With our App, Turn you Business Online to millions of Customers"),
          con(w, "assets/profit.png", "Ease Access of App", "Our App is Easy to use for your Recommended Services"),
          con(w, "assets/profit2.jpg", "Profit is Fast", "You get paid as soon as the Product is delivered. No waiting"),
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
          Text(title,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 19),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 4),
            child: Text(desc,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16),textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
