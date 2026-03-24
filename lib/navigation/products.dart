import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zook/Global/functions.dart';
import 'package:zook/Global/send.dart' show Send;
import 'package:zook/cards/full_card_product.dart';
import 'package:zook/models/ProductModel.dart';

import '../Global/list.dart';

class Products extends StatefulWidget {
   Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  List<ProductModel?> sellers=[];

  int currentPage = 0;
  final int itemsPerPage = 10;

  List<ProductModel?> get pagedSellers {
    final start = currentPage * itemsPerPage;
    final end = (start + itemsPerPage).clamp(0, sellers.length);
    return sellers.sublist(start, end);
  }

  void initState(){
    getall();
  }
  Future<void> getall() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String email = await prefs.getString("email")??"";
      final request = ModelQueries.list(ProductModel.classType,where: ProductModel.EMAIL.eq(email));
      final response = await Amplify.API
          .query(request: request)
          .response;

      if (response.data == null) {
        safePrint('Query failed: ${response.errors}');
        Send.message(context, "Error: ${response.errors}", false);
        return;
      }

      sellers = response.data!.items;

      for (final seller in sellers) {
        if (seller != null) {
          safePrint("Seller Name: ${seller.name}");
          safePrint("Description: ${seller.description}");
          safePrint("-------------------------");
          setState(() {

          });
        }
      }
    }catch(e){
      sellers=[];
    }
  }

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
            sellers==null||sellers.isEmpty?Container(
              width: w,height: 480,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      color: Colors.white,
                      width: w,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.grey.shade200,
                              child: Container(
                                width: w*0.35,
                                height:  w*0.35,
                                color: Colors.grey.shade200,
                              ),
                            ),
                            Container(
                              width: w*0.60-23,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: Colors.white,
                                    highlightColor: Colors.grey.shade200,
                                    child: Container(
                                      color: Colors.grey.shade200,
                                      width: w*0.60-23,
                                      height: 35,
                                    )
                                  ),
                                  Shimmer.fromColors(
                                      baseColor: Colors.white,
                                      highlightColor: Colors.grey.shade200,
                                      child: Container(
                                        color: Colors.grey.shade200,
                                        width: w*0.60-40,
                                        height: 20,
                                      )
                                  ),
                                  Shimmer.fromColors(
                                      baseColor: Colors.white,
                                      highlightColor: Colors.grey.shade200,
                                      child: Container(
                                        color: Colors.grey.shade200,
                                        width: 50,
                                        height: 20,
                                      )
                                  ),
                                  Shimmer.fromColors(
                                      baseColor: Colors.white,
                                      highlightColor: Colors.grey.shade200,
                                      child: Container(
                                        color: Colors.grey.shade200,
                                        width: w*0.60-40,
                                        height: 20,
                                      )
                                  ),
                                  Shimmer.fromColors(
                                      baseColor: Colors.white,
                                      highlightColor: Colors.grey.shade200,
                                      child: Container(
                                        color: Colors.grey.shade200,
                                        width: w*0.60-40,
                                        height: 10,
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },

              ),
            ):Container(
              width: w,
              height: 400,
              child: ListView.builder(
                itemCount: sellers.length,
                itemBuilder: (BuildContext context, int index) {
                  ProductModel product = sellers[index]!;
                  return ProductCard(product: product,);
                },

              ),
            )

          ],
        ),
      ),
    );
  }

}

class ProductCard extends StatefulWidget {
  ProductModel product;
  ProductCard({super.key,required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  void initState(){
    getimage();
  }
  String pic="https://static.vecteezy.com/system/resources/thumbnails/004/683/178/small/icon-broken-image-glyph-style-simple-illustration-editable-stroke-free-vector.jpg";
  Future<void> getimage() async {
    try {
      String inpic = await GlobalFunctions.getpicsfrompath(
          widget.product.picture![0]);
      if (inpic.isNotEmpty || inpic != "NA") {
        pic = inpic;
        setState(() {

        });
      } else {
        pic =
        "https://static.vecteezy.com/system/resources/thumbnails/004/683/178/small/icon-broken-image-glyph-style-simple-illustration-editable-stroke-free-vector.jpg";
      }
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
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>Full_Card_Product(product: widget.product,)));
      },
      child: Container(
        color: Colors.white,
        width: w,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: w*0.35,
                  height:  w*0.35,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(pic),fit: BoxFit.cover)
                  ),
                ),
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
