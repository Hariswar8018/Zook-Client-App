import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xffF6F6F6),
        title: Text("My Notifications",style: TextStyle(fontWeight: FontWeight.w500),),
      ),
    );
  }
}
