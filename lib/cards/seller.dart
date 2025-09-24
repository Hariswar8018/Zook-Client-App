import 'package:flutter/material.dart';
import 'package:zook/Global/widgets.dart';

import '../Global/list.dart';
import 'full_card_product.dart';

class SellerProfile extends StatelessWidget {
  const SellerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GW.returnappbar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(width: w,height:200, fit: BoxFit.cover,"https://m.media-amazon.com/images/S/stores-image-uploads-eu-prod/c/AmazonStores/A21TJRUUN4KGV/724b4e75bd0da57afa3506a83d4e95cc.w3000.h600._CR0%2C0%2C3000%2C600_SX1500_.png",),
            GW.space(0, 15),
            Container(
              width: w,
              child: Row(
                children: [
                  GW.space(10, 0),
                  Image.network("https://m.media-amazon.com/images/S/stores-image-uploads-eu-prod/9/AmazonStores/A21TJRUUN4KGV/ea1e1d593d17dbfd9b3a2b2147c6d041.w400.h400._CR0%2C0%2C400%2C400_SX200_.png",width: 80,height: 80,),
                  GW.space(10, 0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("RealMe Store",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 19),),
                      Container(
                          width: w-20-90,
                          child: Text(maxLines: 2,"ZOOK is a trusted mobile phone retailer offering the latest smartphones, accessories, and unbeatable deals. We connect customers with top brands, fast delivery, and excellent service—online and in-store."
                            ,style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey),))
                    ],
                  ),

                ],
              ),
            ),
            GW.space(0, 19),
            Row(
              children: [
                GW.space(10, 0),
                GW.buildStarRating(4,size: 20),
                Text("  65% Positive ",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16,),),
                 ],
            ),
            Row(
              children: [
                GW.space(10, 0),
                Text(" in the last 12 months   ",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),),
                Text("( 2,130 Ratings )",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16,color: Colors.blue),),
              ],
            ),
            GW.space(0, 12),
            GW.div(),
            GW.space(0, 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Text("About Seller",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16,),),
            ),
            GW.space(0, 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Text("ZOOK is a trusted mobile phone retailer offering the latest smartphones, accessories, and unbeatable deals. We connect customers with top brands, fast delivery, and excellent service—online and in-store."
                ,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,),),
            ),
            GW.space(0, 12),
            GW.div(),
            GW.space(0, 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top Products",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16,),),
                  Text("See All >  ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.blue),),
                ],
              ),
            ),
            GW.space(0, 9),
            container(w),
            GW.space(0, 12),
            GW.div(),
            GW.space(0, 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Text("Reviews",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16,),),
            ),
            GW.space(0, 4),
            Container(
              width: w,
              child: Row(
                children: [
                  GW.space(13, 0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GW.buildStarRating(4,size: 20),
                      Text("1106 Ratings",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: w/3,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey,width: 2
                      )
                    ),
                    child: Center(child: Text("12 Months ⬇️")),
                  )
                ],
              ),
            ),
            GW.space(0, 12),
            star(w, "5", 0.8),
            star(w, "4", 0.5),
            star(w, "3", 0.1),
            star(w, "2", 0.4),
            star(w, "1", 0.1),
            GW.space(12, 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Text("Learn about How Seller Review Works in Zook App",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.blue),),
            ),
            GW.space(0, 4),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/security.png",width: 26,),
                  SizedBox(width: 10,),
                  Container(
                    width: w-25-40,
                    child:  Text("Feedbacks provided by verified Customers of RealMe Store"
                        ,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                  )
                ],
              ),
            ),
            GW.space(0, 6),
            review(5,w, "Rajesh Mehta", "I ordered the Realme GT6 online; delivery was quick, the phone arrived exactly in the condition promised. Everything works smoothly—good display, solid performance, and it feels premium. Really satisfied with the purchase."),
            review(3,w, "Priya Sharma", "Bought a Realme GT 7 Pro recently. Battery life is excellent, its speed is top-notch, and the price was very reasonable for what’s offered. Definitely the best phone I’ve had in this price range"),
            review(4,w, "Amit Reddy", "My phone’s firmware update broke key features—after the update it started freezing, notifications don’t work properly, and customer support has been unresponsive. Still waiting for a fix"),
            review(1,w, "Sneha Iyer", "errible experience with the Realme service centre. My phone frequently lags and at times becomes unresponsive."),
            review(3,w, "Vikram Chauhan", "Received a Realme phone where the battery specification was misleading. The advertised battery capacity was higher, but when I checked the actual device, it was much lower."),
            GW.space(0, 60),
          ],
        ),
      ),
    );
  }
  Widget review(int i,double w ,String desc, String title)=> Container(
    width: w,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GW.buildStarRating(i,size: 20),
          Text(title),
          GW.space(0, 2),
          Text("By $desc on 21st September, 2025",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w800),)
        ],
      ),
    ),
  );
  Widget star(double w, String name, double rates){
    double readrates= rates*100;
    return    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 3),
      child: Row(
        children: [
          Text("$name Star",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600,fontSize: 17),),
          GW.space(6, 0),
          Container(
            width: w-140,
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1.2
                )
            ),
            child: Row(
              children: [
                Container(
                  width: (w-140)*rates,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          GW.space(6, 0),
          Text("${readrates.toStringAsFixed(0)}%",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600,fontSize: 17),),
        ],
      ),
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
}
