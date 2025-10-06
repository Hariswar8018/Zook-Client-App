import 'package:flutter/material.dart';
import 'package:zook/Global/widgets.dart';
import 'package:timelines_plus/timelines_plus.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        title: Text("Order Details",style: TextStyle(fontWeight: FontWeight.w800),),
      ),
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0,vertical: 10),
              child: Text("Ship to",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
            ),
            Center(
              child: Container(
                width: w-25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.9
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      t("Ayusman Samasi"),
                      SizedBox(height: 4,),
                      t("A-10, RS Colony"),t("Near ShaktiNagar School"),t("Rourkela"),t("Odisha"),
                      t("Pin : 769042")
                    ],
                  ),
                ),

              ),
            ),
            GW.space(0, 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: w/2-10,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade100,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: Colors.grey.shade300
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.picture_as_pdf,color: Colors.red,),
                      GW.space(10, 0),
                      Text("Download Invoice",style: TextStyle(fontWeight: FontWeight.w800),)
                    ],
                  ),
                ),
                Container(
                  width: w/2-10,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: Colors.grey.shade300
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.download,color: Colors.black),
                      GW.space(10, 0),
                      Text("Order Summary",style: TextStyle(fontWeight: FontWeight.w800),)
                    ],
                  ),
                ),
              ],
            ),
            GW.space(0, 13),
            GW.div(),
            GW.space(0, 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0,vertical: 10),
              child: Text("Order Summary",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
            ),
            Center(
              child: Container(
                width: w-25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.grey,
                        width: 0.9
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      roww("Items Subtotal", "900"),
                      roww("Shipping", "200"),
                      roww("Total", "1,100"),
                      GW.space(0, 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Grand Total : ",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),),
                          Text("₹1,100",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 15),)
                        ],
                      )

                    ],
                  ),
                ),

              ),
            ),
            GW.space(0, 22),
            GW.div(),
            GW.space(0, 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0,vertical: 10),
              child: Text("Order Details",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
            ),
            Center(
              child: Container(
                width: w-20,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade100,
                      width: 2
                    ),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    Text("    Manage Order",style: TextStyle(fontWeight: FontWeight.w800),),
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
                          Text("Select Status",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                          SizedBox(width: 9,),
                          Icon(Icons.expand_circle_down,color: Colors.white,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            GW.space(0, 12),
            Center(
              child: Container(
                width: w-20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade200,
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      GW.space(10, 0),
                      Container(
                        width: 110,height: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: NetworkImage("https://i.etsystatic.com/53556164/r/il/f0f775/6201962438/il_fullxfull.6201962438_69cw.jpg"))
                        ),
                      ),
                      GW.space(17, 0),
                      Container(
                        width: w-110-70,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("T-Shirt",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
                            GW.space(0, 3),
                            ro("Price : ", "₹900", "Qty : ", "2"),
                            ro("Color : ", "⚫", "Size : ", "XL"),
                            ro("Order Id : ", "HD8229NX", "", ""),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GW.space(0, 8),
            Center(
              child: Container(
                width: w-25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.grey,
                        width: 0.9
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      rowwa("Order Placed", "21st December,2025 at 12:11 PM"),
                      rowwa("Order Id", "KCNKCWODN9128C"),
                      GW.space(0, 4),
                    ],
                  ),
                ),

              ),
            ),
            GW.space(0, 13),
            GW.div(),
            GW.space(0, 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0,vertical: 10),
              child: Text("Order Timeline",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
            ),
            Center(
              child: Container(
                width: w-20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade200,
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 19.0),
                  child: FixedTimeline.tileBuilder(
                    builder: TimelineTileBuilder.connectedFromStyle(
                      contentsAlign: ContentsAlign.basic,
                      oppositeContentsBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Sep ${20-index}, 2025",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 13),),
                            Text("12:35",style: TextStyle(color: Colors.grey,fontSize: 12),)
                          ],
                        ),
                      ),
                      contentsBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(h(index),style: TextStyle(fontWeight: FontWeight.w800,fontSize: 16),),
                            Text(h1(index),style: TextStyle(color: Colors.grey,fontSize: 12),),
                          ],
                        ),
                      ),
                      connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
                      indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
                      itemCount: 7,
                    ),
                    theme: TimelineTheme.of(context).copyWith(
                      nodePosition: 0.3,
                      connectorTheme: TimelineTheme.of(context).connectorTheme.copyWith(
                        thickness: 1.0,
                      ),
                      indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
                        size: 10.0,
                        position: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 90,),
          ],
        ),
      ),
    );
  }

  String h(int i){
    if(i==0){
      return "Rourkela, OD";
    }else if(i==1){
      return "Ranchi, JK";
    }else if(i==2){
      return "Delhi, Delhi";
    }else if(i==3){
      return "Seller Sended";
    }else if(i==4){
      return "Seller Packed";
    }else if(i==5){
      return "Seller Processed";
    }

    return "Customer Ordered";
  }
  String h1(int i){
    if(i<3){
      return "Package arrived at ${h(i)}";
    }else if(i==1){
      return "Ranchi, JK";
    }else if(i==2){
      return "Delhi, Delhi";
    }else if(i==3){
      return "Seller Sended the order through Career";
    }else if(i==4){
      return "Seller Packed your Order";
    }else if(i==5){
      return "Seller Processed the Order";
    }

    return "Customer Order";
  }
  Widget ro(String str1,String str2, String str3, String str4)=> Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      RichText(
        text: TextSpan(
          text: str1,
          style: TextStyle(color: Colors.black, fontSize: 13),
          children: <TextSpan>[
            TextSpan(
              text: str2,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
          ],
        ),
      ),Spacer(),
      RichText(
        text: TextSpan(
          text: str3,
          style: TextStyle(color: Colors.black, fontSize: 13),
          children: <TextSpan>[
            TextSpan(
              text: str4,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),

          ],
        ),
      ),
    ],
  );

  Widget rowwa(String str,String str1)=>Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      t("$str : "),
      t("$str1"),
    ],
  );
  Widget roww(String str,String str1)=>Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      t("$str : "),
      t("₹$str1"),
    ],
  );
  Widget t(String str)=>Text(str,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14),);
}
