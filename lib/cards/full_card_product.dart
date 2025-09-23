import 'package:carousel_slider/carousel_options.dart' show CarouselOptions;
import 'package:carousel_slider/carousel_slider.dart' show CarouselSlider;
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart' show Razorpay;
import 'package:zook/Global/others.dart';

class Full_Card_Product extends StatefulWidget {
 Full_Card_Product({super.key});

  @override
  State<Full_Card_Product> createState() => _Full_Card_ProductState();
}

class _Full_Card_ProductState extends State<Full_Card_Product> {
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
                items: offer.map((i) {
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
                    Text("Samsung Store",style: TextStyle(fontWeight: FontWeight.w800),),
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
              child: Text("Samsung Galaxy M06 5G (Blazing Black, 6GB RAM, 128 GB Storage) | MediaTek Dimensity 6300 | AnTuTu Score 422K+ | 12 5G Bands | 25W Fast Charging | 4 Gen of OS Upgrades | Without Charger",
                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0),
              child: Text("2K+ Bought in last month ",
                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w800,fontSize: 13),),
            ),
            SizedBox(height: 15,),
            div(),
            SizedBox(height: 15,),
            Row(
              children: [
                SizedBox(width: 19,),
                Text("Size :"),
                Text("6 GB RAM, 128 GB Storage",style: TextStyle(fontWeight: FontWeight.w600),),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: w,
              height: w/4+30,
              child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return conta(w,index,index==0?temporary:!temporary);
                },
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 19,),
                Text("- 42%",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800,fontSize: 18),),
                Text(" ₹8,000",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 26),),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 19,),
                Text("MRP : ",style: TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.w800,fontSize: 12),),
                Text("₹15,499", overflow: TextOverflow.clip,style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey.shade500,fontWeight: FontWeight.w800,fontSize: 12),),
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
                Text("from ₹327. No Cost EMI Available ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 12),),
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
                Text("₹8,000",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 17),),
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
                Text(" 4 hr 20 mins",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700,fontSize: 14),),
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
                Text("Darshita. Etl. ",style: TextStyle(fontWeight: FontWeight.w800),),
              ],
            ),
            SizedBox(height: 20,),
            div(),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 19.0),
              child: Text("Shop with Confidence",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 16),),
            ),
            SizedBox(height: 90,),
          ],
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap:(){
                Razorpay _razorpay = Razorpay();
                var options = {
                  'key': 'rzp_test_RIFjcoGeZrQTCR',
                  'amount': 800000,
                  'name': 'ZOOK App Samsung Galaxy Purchase',
                  'description': 'Fine T-Shirt',
                  'prefill': {
                    'contact': '+917978097489',
                    'email': 'ayush@razorpay.com'
                  }
                };
                _razorpay.open(options);
              },
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
