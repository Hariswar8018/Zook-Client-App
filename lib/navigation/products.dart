import 'package:flutter/material.dart';
import 'package:zook/cards/full_card_product.dart';

import '../Global/list.dart';

class Products extends StatelessWidget {
   Products({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffF6F6F6),
        title: Text("My Products",style: TextStyle(fontWeight: FontWeight.w800),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text("Search by Category",style: TextStyle(fontWeight: FontWeight.w600),),
            ),
            Container(
              width: w,height: 100,
              child: ListView.builder(
                itemCount: GL.logo.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 80,height: 100,
                    child: Column(
                      children: [
                        Container(
                          width: 70,height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image: AssetImage(GL.logo[index]))
                          ),
                        ),
                        Text(GL.logoname[index],style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text("My All Products",style: TextStyle(fontWeight: FontWeight.w600),),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Full_Card_Product()));
              },
              child: Container(
                color: Colors.white,
                width: w,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: w*0.40,
                        height:  w*0.40,
                        child: Image.network("https://m.media-amazon.com/images/I/41cCL08SxvL._SY300_SX300_QL70_FMwebp_.jpg"),
                      ),
                      Container(
                        width: w*0.60-23,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Samsung Galaxy M06 5G (Blazing Black, 6GB RAM, 128 GB Storage)",
                              maxLines:3,style: TextStyle(fontWeight: FontWeight.w800),),
                            Row(
                              children: [
                                Text("3.9",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 12),),
                                SizedBox(width: 2,),
                                buildStarRating(4),
                                SizedBox(width: 8,),
                                Icon(Icons.arrow_drop_down_outlined,),
                                Text("( 2.9 K)",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w800,fontSize: 12),),
              
                              ],
                            ),
                            Text("2K+ Bought in last month ",
                              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w800,fontSize: 13),),
                            SizedBox(height: 3,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("₹ 75,000",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20),),
                                Text("  MRP ",style: TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.w800,fontSize: 12),),
                                Text("86,000", overflow: TextOverflow.clip,style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey.shade500,fontWeight: FontWeight.w800,fontSize: 12),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Full_Card_Product()));
              },
              child: Container(
                color: Colors.white,
                width: w,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: w*0.40,
                        height:  w*0.40,
                        child: Image.network("https://m.media-amazon.com/images/I/61muVCIy-uL._SX569_.jpg"),
                      ),
                      Container(
                        width: w*0.60-23,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("OnePlus 13R | Smarter with OnePlus AI | Lifetime Display Warranty (12GB RAM, 256GB Storage Nebula Noir)",
                              maxLines:3,style: TextStyle(fontWeight: FontWeight.w800),),
                            Row(
                              children: [
                                Text("3",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 12),),
                                SizedBox(width: 2,),
                                buildStarRating(3),
                                SizedBox(width: 8,),
                                Icon(Icons.arrow_drop_down_outlined,),
                                Text("( 90.9 K)",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w800,fontSize: 12),),
                              ],
                            ),
                            Text("6K+ Bought in last month ",
                              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w800,fontSize: 13),),
                            SizedBox(height: 3,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("₹ 1,22,000",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20),),
                                Text("  MRP ",style: TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.w800,fontSize: 12),),
                                Text("2,00,000", overflow: TextOverflow.clip,style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey.shade500,fontWeight: FontWeight.w800,fontSize: 12),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Full_Card_Product()));
              },
              child: Container(
                color: Colors.white,
                width: w,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: w*0.40,
                        height:  w*0.40,
                        child: Image.network("https://m.media-amazon.com/images/I/71ajrL7sHNL._SX679_.jpg"),
                      ),
                      Container(
                        width: w*0.60-23,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Samsung Galaxy Tab S9, S Pen in-Box, 27.81 cm (11 inch) Dynamic AMOLED 2X Display, RAM 8 GB, ROM 128 GB Expandable, Wi-Fi Tablet, Gray",
                              maxLines:3,style: TextStyle(fontWeight: FontWeight.w800),),
                            Row(
                              children: [
                                Text("4.5",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 12),),
                                SizedBox(width: 2,),
                                buildStarRating(5),
                                SizedBox(width: 8,),
                                Icon(Icons.arrow_drop_down_outlined,),
                                Text("( 1.2 K)",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w800,fontSize: 12),),
        
                              ],
                            ),
                            Text("500+ Bought in last month ",
                              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w800,fontSize: 13),),
                            SizedBox(height: 3,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("₹ 7,000",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20),),
                                Text("  MRP ",style: TextStyle(color: Colors.grey.shade500,fontWeight: FontWeight.w800,fontSize: 12),),
                                Text("12,000", overflow: TextOverflow.clip,style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.grey.shade500,fontWeight: FontWeight.w800,fontSize: 12),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
