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
          )
        ],
      ),
    );
  }
}
