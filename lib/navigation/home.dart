import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class Home extends StatelessWidget {
   Home({super.key});

  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xffF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffF6F6F6),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 20,),
            Center(
              child: Container(
                width: w-20,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    Text("    Sells Statistics",style: TextStyle(fontWeight: FontWeight.w800),),
                    Spacer(),
                    Container(
                      width: (w-20)/2,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("This Week",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                          SizedBox(width: 9,),
                          Icon(Icons.expand_circle_down,color: Colors.white,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Container(
                  width: w-20,
                  height: w-120,
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: SfCartesianChart(
                          primaryXAxis: DateTimeAxis(),
        
                          series: <CartesianSeries>[
                            LineSeries<SalesData, DateTime>(
                                dataSource: chartData,
                                xValueMapper: (SalesData sales, _) => sales.year,
                                yValueMapper: (SalesData sales, _) => sales.sales
                            )
                          ]
                      ),
                    ),
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Text("Recent Orders",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Text("Your Top 10 Trending Products",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Text("Your 10 Sell Products",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
            ),
        
          ],
        ),
      )
    );
  }
   final List<SalesData> chartData = [
     SalesData(DateTime.now().subtract(Duration(days: 1)), 35),
     SalesData(DateTime.now().subtract(Duration(days: 2)), 28),
     SalesData(DateTime.now().subtract(Duration(days: 3)), 34),
     SalesData(DateTime.now().subtract(Duration(days: 4)), 32),
     SalesData(DateTime.now().subtract(Duration(days: 5)), 40),
     SalesData(DateTime.now().subtract(Duration(days: 6)), 18),
     SalesData(DateTime.now().subtract(Duration(days: 7)), 40)

   ];

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
                  Text(Helper.returnString(index),style: TextStyle(fontSize: 18),),
                ],
              ),
              Spacer(),
              Text(Helper.returnint(index).toString(),style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900),)
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
  static int returnint(int j){
    if(j==0){
      return 300;
    }else if(j==1){
      return 24;
    }else if(j==2){
      return 56;
    }else {
      return 2;
    }
  }
  static String returnString(int j){
    if(j==0){
      return "Pendings";
    }else if(j==1){
      return "Transit";
    }else if(j==2){
      return "Completed";
    }else {
      return "Cancelled";
    }
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}