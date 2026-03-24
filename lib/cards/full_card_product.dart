import 'package:carousel_slider/carousel_options.dart' show CarouselOptions;
import 'package:carousel_slider/carousel_slider.dart' show CarouselSlider;
import 'package:flutter/material.dart';
import 'package:zook/Global/others.dart';
import 'package:zook/models/ModelProvider.dart';

import '../Global/functions.dart';
import '../Global/list.dart';
import '../Global/widgets.dart';

class Full_Card_Product extends StatefulWidget {
  ProductModel product;
 Full_Card_Product({super.key,required this.product});

  @override
  State<Full_Card_Product> createState() => _Full_Card_ProductState();
}

class _Full_Card_ProductState extends State<Full_Card_Product> {

  void initState(){
    getimage();
  }
  String pic="https://static.vecteezy.com/system/resources/thumbnails/004/683/178/small/icon-broken-image-glyph-style-simple-illustration-editable-stroke-free-vector.jpg";

   List<String> pics=[];
  Future<void> getimage() async {
    try {
      for(var i in widget.product.picture!){
        String inpic = await GlobalFunctions.getpicsfrompath(i);
        if (inpic.isNotEmpty || inpic != "NA") {
          pics.add(inpic);
        } else {
          pics.add(pic);
        }
      }
      setState(() {
        bool d=false;
      });
    }catch(e){
      pic =
      "https://static.vecteezy.com/system/resources/thumbnails/004/683/178/small/icon-broken-image-glyph-style-simple-illustration-editable-stroke-free-vector.jpg";

    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xffF6F6F6),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: w,
              height: w,
              child: CarouselSlider(
                options: CarouselOptions(
                    height: w,enableInfiniteScroll: true,enlargeCenterPage: true,
                    viewportFraction: 1.0,           // Shows only 1 image at a time
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5)
                ),
                items: pics.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(i),fit: BoxFit.cover)
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                    child: Icon(Icons.favorite_border,size: 27,),
                  ),
                  Icon(Icons.share_outlined,size: 27,),
                  SizedBox(width: 15,)
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: 15,),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: CircleAvatar(
                      radius: 19,
                      backgroundImage: NetworkImage("https://play-lh.googleusercontent.com/dPPjCUePMddFVJC2z5eGWSgoJqCj63TTIEWt0Ycs6CGeHgytD_UNP9MPH-fGqRi3U9s"),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.brandname!,style: TextStyle(fontWeight: FontWeight.w800),),
                    Text("Visit the Store",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.blue),)
                  ],
                ),
                Spacer(),
                buildStarRating(4),
                SizedBox(width: 1,),
                Icon(Icons.arrow_drop_down_outlined,),
                Text("( 2900 )     ",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w800,fontSize: 12),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Text(widget.product.name!,
                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
            ),
            widget.product.totalbuyed==0?SizedBox():Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0),
              child: Text("${widget.product.totalbuyed}K+ Bought in last month ",
                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w800,fontSize: 13),),
            ),
            SizedBox(height: 15,),
            div(),
            SizedBox(height: 15,),
            widget.product.isdiffrentiable!?Row(
              children: [
                SizedBox(width: 19,),
                Text("Variant :"),
                Text("6 GB RAM, 128 GB Storage",style: TextStyle(fontWeight: FontWeight.w600),),
              ],
            ):SizedBox(),
            widget.product.isdiffrentiable!?SizedBox(height: 10,):SizedBox(),
            widget.product.isdiffrentiable!?Container(
              width: w,
              height: w/4+30,
              child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return conta(w,index,index==0?temporary:!temporary);
                },
              ),
            ):SizedBox(),
            widget.product.isdiffrentiable!?SizedBox(height: 20,):SizedBox(),
            Row(
              children: [
                SizedBox(width: 19,),
                Text("- ${((widget.product.sellingvlue!/widget.product.mrp!)*100).toInt()}%",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800,fontSize: 18),),
                Text(" ₹${widget.product.sellingvlue}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 26),),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 19,),
                Text("MRP : ",style: TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.w800,fontSize: 12),),
                Text("₹${widget.product.mrp}", overflow: TextOverflow.clip,style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey.shade500,fontWeight: FontWeight.w800,fontSize: 12),),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 19.0),
              child: Container(
                width: w/3,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/security.png",width: 15),
                      Text("  Zook Fullfilled",style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 19,),
                Text("EMI ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 12),),
                Text("from ₹${widget.product.sellingvlue!*0.5.toInt()}. No Cost EMI Available ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 12),),
                ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19.0,bottom: 10),
              child: Text("See EMI Options",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700,fontSize: 12),),
            ),
            Row(
              children: [
                SizedBox(width: 19,),
                Text("Inclusive of All Taxes",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 12),),
              ],
            ),
            SizedBox(height: 10,),
            div(),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: 19,),
                Text("Total : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 14),),
                Text("₹${widget.product.sellingvlue}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 17),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: 19,),
                Text("FREE delivery",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),),
                Text(" Wednesday, 24 September",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 14),),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: 19,),
                Text("Order Within ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),),
                Text(" ${getTimeLeftTo5PM()}",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700,fontSize: 14),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: 19,),
                Icon(Icons.location_on_sharp,size: 20,),
                SizedBox(width: 2),
                Text("Deliver to : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14),),
                Text("769042, Jhirpani, Rourkela, Odisha",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700,fontSize: 14),),
              ],
            ),
            SizedBox(height: 30,),
            Center(
              child: Container(
                width: w-20,
                height: 50,
                color: Colors.black,
                child: Center(child:
                Text("Buy Now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 19),)),
              ),
            ),
            SizedBox(height: 4),
            Center(
              child: Container(
                width: w-20,
                height: 50,
                color: Colors.yellow,
                child: Center(child:
                Text("Add to Cart",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 19),)),
              ),
            ),
            SizedBox(height: 25,),
            Row(
              children: [
                SizedBox(width: 19,),
                Container(
                  width: w/2-25,
                  child: Text("Ships from "),
                ),
                Text("Zook Pvt. Ltd.",style: TextStyle(fontWeight: FontWeight.w800),),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 19,),
                Container(
                  width: w/2-25,
                  child: Text("Sold by"),
                ),
                Text("${widget.product.company_name}",style: TextStyle(fontWeight: FontWeight.w800),),
              ],
            ),
            SizedBox(height: 20,),
            div(),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 19.0),
              child: Text("Shop with Confidence",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ListTile(
                leading: Icon(Icons.local_shipping),
                title: Text("Free Delivery",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w800),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ListTile(
                leading: Icon(Icons.security),
                title: Text("Secure Transactions",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w800),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ListTile(
                leading: Icon(Icons.add_business),
                title: Text("Zook Delivered",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w800),),
              ),
            ),
            SizedBox(height: 20,),
            div(),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 19.0),
              child: Text("You Might also like",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),),
            ),
            SizedBox(height: 10,),
            container(w),
            SizedBox(height: 20,),
            div(),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 19.0),
              child: Text("Description",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),),
            ),
            SizedBox(height: 10,),
            k(w, "OS", "Android 14"),
            k(w, "RAM", "4 GB"),
            k(w, "Product Dimensions", "18 x 8 x 6 cm; 570 g"),
            k(w, "Batteries", "1 12V batteries required"),
            k(w, "Item model number", "Redmi Note 14 Pro+ 5G"),
            k(w, "Other display features", "Wireless"),
            k(w, "Resolution", "1220 x 2712 pixels"),
            SizedBox(height: 19,),
            Padding(
              padding: const EdgeInsets.only(left: 19.0),
              child: Text("What is in the box?",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19.0,right: 19),
              child: Text(widget.product.boxcontent!
                ,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Colors.grey),),
            ),
            SizedBox(height: 20,),
            div(),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text("Reviews",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),),
            ),
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
                            color: Colors.grey.shade500,width: 0.3
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("12 Months "),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                  SizedBox(width: 10,)
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
            SizedBox(height: 90,),
          ],
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: Container(
                width: w-80,
                height: 50,
                color: Colors.black,
                child: Center(child:
                Text("Buy Now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 19),)),
              ),
            ),

            Container(
              width: 50,
              height: 50,
              color: Colors.black,
              child: Icon(Icons.shopping_cart_rounded,color: Colors.white,),
            ),
          ],
        )
      ],
    );
  }
  Widget k(double w , String str, String str2)=> Container(
    width: w,
    child: Row(
      children: [
        SizedBox(width: 19,),
        Container(
          width: w/2-20,
          child: Text(str,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w900),),
        ),
        Container(
          width: w/2-20,
          child: Text(str2,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
        ),
      ],
    ),
  );

  String? getTimeLeftTo5PM() {
    final now = DateTime.now();

    // Define today’s 5:00 PM
    final today5PM = DateTime(now.year, now.month, now.day, 17, 0);

    // Define today’s 4:50 PM
    final today4_50PM = DateTime(now.year, now.month, now.day, 16, 50);

    DateTime targetTime;

    if (now.isAfter(today5PM)) {
      // If it's after 5 PM, target is 5 PM of next day
      targetTime = today5PM.add(const Duration(days: 1));
    } else {
      // If before 5 PM, target is today’s 5 PM
      targetTime = today5PM;
    }

    // If time is after 4:50 PM but before 5 PM → return nothing
    if (now.isAfter(today4_50PM) && now.isBefore(today5PM)) {
      return null;
    }

    // Calculate the duration difference
    final difference = targetTime.difference(now);

    final hours = difference.inHours;
    final minutes = difference.inMinutes.remainder(60);

    return "$hours hours and $minutes minutes";
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

  Widget div()=>Padding(
    padding: const EdgeInsets.symmetric(horizontal: 19.0),
    child: Divider(),
  );

  bool temporary=false;

 Widget conta(double w, int index,bool on){
   return InkWell(
     onTap: (){
       temporary=!temporary;
       setState(() {

       });
     },
     child: Padding(
       padding: const EdgeInsets.only(left: 19),
       child: Container(
         width: w/2-10,
         height: w/4+30,
         decoration: BoxDecoration(
           border: Border.all(color: on? Colors.blue:Colors.grey.shade200,width: 2),
           borderRadius: BorderRadius.circular(10)
         ),
         child: Column(
           children: [
             Container(
               width: w/2-10,
               height: ((w/4+30)/2)-10,
               decoration: BoxDecoration(
                 color: on?Colors.blue.shade50:Colors.grey.shade200,
                 borderRadius: BorderRadius.only(
                   topRight: Radius.circular(10),
                   topLeft: Radius.circular(10),
                 )
               ),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(index==0?"16 GB RAM, 512 GB Storage, 8000 Mah Battery":"6 GB RAM, 128 GB Storage, 4000 Mah Battery",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13),),
               ),
             ),
             Container(
               width: w/2-10,
               height: ((w/4+30)/2),
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(index==0?"₹20,000":"₹ 8,000",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20),),
                     Text(index==0?"30,000":"13,000", overflow: TextOverflow.clip,style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey.shade500,fontWeight: FontWeight.w800,fontSize: 12),),
                     Text("In Stock",
                       style: TextStyle(color: Colors.green,fontWeight: FontWeight.w400,fontSize: 12),),
                   ],
                 ),
               ),
             ),
           ],
         ),
       ),
     ),
   );
 }

  List<String> offer=[
    "https://m.media-amazon.com/images/I/71iMTdPA34L._SX679_.jpg",
    "https://m.media-amazon.com/images/I/81pbWME2WmL._SX679_.jpg",
    "https://m.media-amazon.com/images/I/81UhBwEm1TL._SX679_.jpg",
    "https://m.media-amazon.com/images/I/811j4RNHVvL._SX679_.jpg"
  ];

 Widget buildStarRating(int i, {double size = 15, Color filledColor = Colors.orange, Color borderColor = Colors.grey}) {
   return Row(
     mainAxisSize: MainAxisSize.min,
     children: List.generate(5, (index) {
       return Icon(
         index < i ? Icons.star : Icons.star_border,
         color: index < i ? filledColor : borderColor,
         size: size,
       );
     }),
   );
 }
}
