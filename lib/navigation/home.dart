import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';


class Home extends StatelessWidget {
   Home({super.key});

  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading:Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Padding(
              padding: EdgeInsets.all(1.0),
              child: CircleAvatar(
                backgroundImage:
                NetworkImage("https://cdn.vectorstock.com/i/500p/20/76/man-profile-icon-round-avatar-vector-21372076.jpg"),
              ),
            ),
          ),
        ),centerTitle: true,
        title: Text("Br Nr Innovations",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15),),
        actions: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade400
              ),
              shape: BoxShape.circle
            ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.notifications,size: 18,),
              )),
          SizedBox(width: 14,),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 14,
          ),
          Container(
            width: w,
            height: w/4+15,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return conta(w,index);
              },
            ),
          ),
        ],
      )
    );
  }
  Widget conta(double w, int index){
    return Padding(
      padding: const EdgeInsets.only(left: 19),
      child: Container(
        width: w/2-10,
        height: w/4+50,
        decoration: BoxDecoration(
          color: Helper.returnColor(index),
          borderRadius: BorderRadius.circular(10)
        ),
        child:Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.black,
                    child: Helper.returnIcon(index),
                  ),
                  SizedBox(width: 10,),
                  Text("Orders",style: TextStyle(fontSize: 18),),
                ],
              ),
              Spacer(),
              Text("92",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900),)
            ],
          ),
        ),
      ),
    );
  }
}

class Helper{

  static Color returnColor(int j){
    if(j==0){
      return Color(0xffFFE8CE);
    }else if(j==1){
      return Color(0xffE8EFFF);
    }else if(j==2){
      return Color(0xffFDEDEE);
    }else {
      return Color(0xffE5FDF2);
    }
  }
  static Icon returnIcon(int j){
    if(j==0){
      return Icon(Icons.shopping_cart_rounded,color: Colors.white,size: 17,);
    }else if(j==2){
      return Icon(Icons.verified,color: Colors.white,size: 17);
    }else if(j==1){
      return Icon(Icons.local_shipping,color: Colors.white,size: 17);
    }else {
      return Icon(Icons.cancel_sharp,color: Colors.white,size: 17);
    }
  }
}