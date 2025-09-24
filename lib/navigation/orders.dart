import 'package:flutter/material.dart';
import 'package:zook/Global/widgets.dart';
import 'package:zook/cards/order_details.dart';
import 'package:zook/navigation/home.dart';

class Orders extends StatelessWidget {
  Orders({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffF6F6F6),
        title: Text("My Orders",style: TextStyle(fontWeight: FontWeight.w800),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search Your Orders',
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (query) {
        
                },
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Container(
                width: w-15,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Color of the shadow
                      offset: Offset(0, 1), // x, y offset of the shadow
                      blurRadius: 1, // How blurry the shadow edges are
                      spreadRadius: 1, // How much the shadow expands
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0,top: 1),
                        child: Text("My Orders",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 19),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: w/4-14,
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Helper.returnColor(0)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Pending"),
                                Text("100",style: TextStyle(fontWeight: FontWeight.w800),)
                              ],
                            ),
                          ),
                          Container(
                            width: w/4-14,
                            height: 65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Helper.returnColor(1)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Transit"),
                                Text("70",style: TextStyle(fontWeight: FontWeight.w800),)
                              ],
                            ),
                          ),Container(
                            width: w/4-14,
                            height: 65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Helper.returnColor(2)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Completed"),
                                Text("10",style: TextStyle(fontWeight: FontWeight.w800),)
                              ],
                            ),
                          ),Container(
                            width: w/4-14,
                            height: 65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Helper.returnColor(3)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Cancelled"),
                                Text("990",style: TextStyle(fontWeight: FontWeight.w800),)
                              ],
                            ),
                          ),


                        ],
                      ),
                    ],
                  ),
                )
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>OrderDetails()));
              },
              child: Container(
                width: w,height: h-200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Color of the shadow
                      offset: Offset(0, 1), // x, y offset of the shadow
                      blurRadius: 1, // How blurry the shadow edges are
                      spreadRadius: 1, // How much the shadow expands
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 22,),
                    Container(
                      width: w,
                      height: 40,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return rows(strr(index),index,w);
                        },
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: w,
                      child: Row(
                        children: [
                          GW.space(24, 0),
                          Container(
                            width: 110,height: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image: NetworkImage("https://i.etsystatic.com/53556164/r/il/f0f775/6201962438/il_fullxfull.6201962438_69cw.jpg"))
                            ),
                          ),
                          GW.space(17, 0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Bunzee Black T-Shirt",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
                              GW.space(0, 3),
                              Text("Price : ₹900.00",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                              Text("#89GHSD92    12 Sep, 2025",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.grey),),
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
                    GW.space(0, 10),
                    Container(
                      width: w,
                      child: Row(
                        children: [
                          GW.space(24, 0),
                          Container(
                            width: 110,height: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: NetworkImage("https://m.media-amazon.com/images/I/71r0BBNmBOL._SX679_.jpg"))
                            ),
                          ),
                          GW.space(17, 0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("HP 15, 13th Gen Intel",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
                              GW.space(0, 3),
                              Text("Price : ₹5,00,000.00",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                              Text("#83989EH    1 June, 2025",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.grey),),
                              GW.space(0, 2),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.green.shade50,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
                                  child: Text("Completed",style: TextStyle(color: Colors.black,),
                                ),
                              ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    GW.space(0, 10),
                    Container(
                      width: w,
                      child: Row(
                        children: [
                          GW.space(24, 0),
                          Container(
                            width: 110,height: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: NetworkImage("https://m.media-amazon.com/images/I/61gYxcIGjvL._SY450_.jpg"))
                            ),
                          ),
                          GW.space(17, 0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("boAt Rockerz 550",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
                              GW.space(0, 3),
                              Text("Price : ₹500.00",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                              Text("#89GHSD45    12 Jun, 2025",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.grey),),
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
                    GW.space(0, 10),
                    Container(
                      width: w,
                      child: Row(
                        children: [
                          GW.space(24, 0),
                          Container(
                            width: 110,height: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: NetworkImage("https://m.media-amazon.com/images/I/41nTSR0PETL._SX300_SY300_QL70_FMwebp_.jpg"))
                            ),
                          ),
                          GW.space(17, 0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ghar Soaps Magic De-Tan",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
                              GW.space(0, 3),
                              Text("Price : ₹500.00",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                              Text("#89YIUD92    12 Sep, 2025",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.grey),),
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
                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  String strr(int u){
    if(u==0){
      return "All Orders";
    }else if(u==1){
      return "New Orders";
    }else if(u==2){
      return "Pending";
    }else if(u==3){
      return "Processing";
    } return "Cancelled";
  }
  Widget rows(String str, int j , double w){
    return InkWell(
      onTap: (){

      },
      child: Column(
        children: [
          Text(str,style: TextStyle(color: i==j?Colors.black:Colors.grey),),
          SizedBox(height: 4),
          Container(width: w/3,height: 4,color:i==j?Colors.orange:Colors.grey),
        ],
      ),
    );
  }

  int i = 0;

}
