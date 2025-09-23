import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

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
                height: 200,
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
              ),
            ),
            SizedBox(height: 30,),
            Container(
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
            )
          ],
        ),
      ),
    );
  }
}
