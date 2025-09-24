import 'package:flutter/material.dart';

class Web extends StatefulWidget {
  const Web({super.key,required this.name, required this.link});
  final String link, name;

  @override
  State<Web> createState() => _WebState();
}

class _WebState extends State<Web> {
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
