import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zook/Global/global_model.dart';
import 'package:zook/Global/list.dart';
import 'package:zook/Global/widgets.dart';
import 'package:zook/cards/full_card_product.dart' show Full_Card_Product;

import '../cards/order_details.dart';
import '../cards/seller.dart';
import '../second_pages/notification.dart' show Notifications;


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
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>SellerProfile(seller: Session.seller,)));
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: CircleAvatar(
                  backgroundImage:
                  NetworkImage(Session.seller.logo??"https://cdn.vectorstock.com/i/500p/20/76/man-profile-icon-round-avatar-vector-21372076.jpg"),
                ),
              ),
            ),
          ),
        ),centerTitle: true,
        title: Text(Session.seller.name!,style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15),),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>Notifications()));
            },
            child: Container(
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
          ),
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
                    InkWell(
                      onTap: (){
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.calendar_view_week),
                                    title: const Text("This Week"),
                                    onTap: () {
                                      Navigator.pop(context, "Week");
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.calendar_view_month),
                                    title: const Text("This Month"),
                                    onTap: () {
                                      Navigator.pop(context, "Month");
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.calendar_today),
                                    title: const Text("This Year"),
                                    onTap: () {
                                      Navigator.pop(context, "Year");
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ).then((value) {
                          if (value != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("You selected: $value")),
                            );
                          }
                        });
                      },
                      child: Container(
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
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>OrderDetails()));
              },
              child: Container(
                width: w,
                height: 120,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        width: w-60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GW.space(8, 0),
                              Container(
                                width: 80,height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(image: NetworkImage("https://m.media-amazon.com/images/I/41nTSR0PETL._SX300_SY300_QL70_FMwebp_.jpg"))
                                ),
                              ),
                              GW.space(16, 0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Ghar Soaps Magic De-Tan",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15),),
                                  GW.space(0, 3),
                                  Text("Price : ₹500.00",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
                                  Text("#89YIUD92    12 Sep, 2025",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13,color: Colors.grey),),
                                  GW.space(0, 2),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.orange.shade50,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
                                      child: Text("Pending",style: TextStyle(color: Colors.red),),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Text("Your Top 10 Trending Products",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
            ),
            container(w),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Text("Your 10 Sell Products",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
            ),
            container(w),
            SizedBox(height: 90,)
          ],
        ),
      )
    );
  }

  Widget container(double w ){
    return Container(
      width: w,
      height: w/3+150,
      child: ListView.builder(
        itemCount: GL.name.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 11.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Full_Card_Product()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 8),
                        child: Container(
                          width: w/3,height: w/3,
                          decoration:BoxDecoration(
                            image: DecorationImage(image: NetworkImage(GL.pic[index]))
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(width: w/3,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(GL.name[index],style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700,fontSize: 13),maxLines: 2,),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GW.buildStarRating(4),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("${GW.generateRandomNumber(4)} Reviews",style: TextStyle(fontSize: 12,),),
                    ),
                    GW.space(0, 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: RichText(
                          text: TextSpan(
                            text: '-50%',
                            style: TextStyle(color: Colors.red, fontSize: 16,fontWeight: FontWeight.w700),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' ₹7,499',
                                style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black,fontSize: 13),
                              ),
                            ],
                          )
                      ),
                    ),
                    GW.space(0, 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: RichText(
                          text: TextSpan(
                            text: 'MRP : ',
                            style: TextStyle(color: Colors.black, fontSize: 11,fontWeight: FontWeight.w400),
                            children: <TextSpan>[
                              TextSpan(
                                text: '₹9,499',
                                style: TextStyle(fontWeight: FontWeight.w400, color:Colors.black,fontSize: 11,decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
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

