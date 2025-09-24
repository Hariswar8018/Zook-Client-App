import 'package:flutter/material.dart';
import 'package:zook/cards/seller.dart';
import 'package:zook/main.dart';
import 'package:zook/second_pages/notification.dart';

import '../second_pages/web.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade200
                      ),
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(image: NetworkImage("https://cdn.vectorstock.com/i/500p/20/76/man-profile-icon-round-avatar-vector-21372076.jpg"))
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6,left: 10),
                  child: Text("Br Nr Innovation",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("ZOOK1928927U",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.grey),),
                ),
                SizedBox(height: 35,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>SellerProfile()));
                  },
                  child: con(Colors.orange.shade50, "Seller Account",
                      Icon(Icons.person_outline_rounded,color: Colors.orange,)),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Web(name: 'About Us', link: 'https://www.brnrinnovations.com/',)));
                  },
                  child: con(Colors.blue.shade50, "General Statement",
                      Icon(Icons.post_add,color: Colors.blue,)),
                ),
            
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Notifications()));
                  },
                  child: con(Colors.red.shade50, "Notification",
                      Icon(Icons.notifications,color: Colors.red)),
                ),
                con(Colors.green.shade50, "Language",
                    Icon(Icons.language,color: Colors.green,)),
            
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Web(name: 'About Us', link: 'https://www.brnrinnovations.com/',)));
                  },
                  child: con(Colors.orange.shade50, "Seller Help Center",
                      Icon(Icons.support_agent,color: Colors.orange,)),
                ),
            
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Web(name: 'About Us', link: 'https://www.brnrinnovations.com/',)));
                  },
                  child: con(Colors.blue.shade50, "About",
                      Icon(Icons.info,color: Colors.blue,)),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>MyHomePage(title: "")));
                  },
                  child: con(Colors.orange.shade50, "Log Out",
                      Icon(Icons.logout_outlined,color: Colors.red,)),
                ),

                SizedBox(height: 30,),
                Center(child: Image.asset("assets/logo.jpg",width: 50,)),
                Center(child: Text("Zook  v.1.0.0",style: TextStyle(color: Colors.grey),),),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget con(Color color, String title, Icon icon){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05), // Shadow color with opacity
                spreadRadius: 1, // Extends the shadow from the container
                blurRadius: 15, // Blurs the shadow
                offset: const Offset(0, 3), // Changes the position of the shadow
              ),
            ],
          ),
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 9),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor:color,
                  child: icon,
                ),
                SizedBox(width: 13),
                Text(title,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                Spacer(),
                Icon(Icons.arrow_forward_ios,size: 20,),
              ],
            ),
          )
      ),
    );
  }
}
