import 'package:flutter/material.dart';
import 'package:zook/admin/companies.dart';

class NavAdmin extends StatelessWidget {
  const NavAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Admin Panel",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>All_Companies()));
            },
            leading: Icon(Icons.work),
            title: Text("All Companies",style: TextStyle(fontWeight: FontWeight.w700),),
            subtitle: Text("Check all Companies/LLP selling in Zook"),
          ),
          aa(Icon(Icons.view_carousel),"Home Screen Carousel","Edit the Home Screen Carousel of Customer App"),
          aa(Icon(Icons.production_quantity_limits),"Manage Products","Manage Products and "),
          aa(Icon(Icons.api),"Dart / ShipRocket Api","Manange API keys for Shipping Charges"),
          aa(Icon(Icons.face),"Machine Learning Training","Manange how Machine Learning behaves under the App"),
        ],
      ),
    );
  }
  Widget aa(Widget w, String str,String str2){
    return ListTile(
      leading: Icon(Icons.work),
      title: Text(str,style: TextStyle(fontWeight: FontWeight.w700),),
      subtitle: Text(str2),
    );
  }
}
