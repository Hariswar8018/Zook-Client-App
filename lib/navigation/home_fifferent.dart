import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Container(
            width: w,
            height: 130,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xff86DEDF),
                  Color(0xffA4E5CF)
                ])
            ),
            child: Column(
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        width: w-70,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade100
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5), // Color of the shadow
                                offset: Offset(0, 5), // x, y offset of the shadow
                                blurRadius: 10, // How blurry the shadow edges are
                                spreadRadius: 1, // How much the shadow expands
                              ),
                            ]
                        ),
                        child: Center(
                          child: Padding(
                              padding: const EdgeInsets.only( left :15, right : 18.0),
                              child: TextFormField(
                                controller:pass,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: '🔍   Search or Ask a Question',
                                  isDense: true,
                                  border: InputBorder.none, // No border
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.qr_code),
                  ],
                ),
                SizedBox(height: 4,),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.location_on),SizedBox(width: 5,),
                    Text("Deliver to : 769042"),SizedBox(width: 5,),
                    Icon(Icons.keyboard_arrow_down_outlined)
                  ],
                ),
                SizedBox(height: 9,)
              ],
            ),
          ),
          Container(
            width: w,
            height: w,
            child: CarouselSlider(
              options: CarouselOptions(
                  height: w,enableInfiniteScroll: true,enlargeCenterPage: true,
                  viewportFraction: 1.0,           // Shows only 1 image at a time
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5)
              ),
              items: offer.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(i),fit: BoxFit.cover)
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Container(
            width: w,
            height: w/5+120,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ListView.builder(
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      width: w/3,
                      height: w/3+90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5), // Color of the shadow
                              offset: Offset(0, 1), // x, y offset of the shadow
                              blurRadius: 1, // How blurry the shadow edges are
                              spreadRadius: 1, // How much the shadow expands
                            ),
                          ],
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 4,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(list2[index],style: TextStyle(fontWeight: FontWeight.w700),),
                          ),
                          Image.network(list[index],width: w/3,)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
  List<String> list = [
    "https://m.media-amazon.com/images/I/61XCqK+a6LL.jpg","https://m.media-amazon.com/images/I/613C4vFxsBL._SX679_.jpg",
    "https://m.media-amazon.com/images/I/61A0IqCrmHL._UF894,1000_QL80_.jpg","https://m.media-amazon.com/images/I/61PBLEFPoKL._UF1000,1000_QL80_.jpg",
    "https://m.media-amazon.com/images/I/71AjVtu6pbL.jpg"
  ];
  List<String> list2 = [
    "Keep Shopping for Womens","Deals Related to saved items","4+ star deal for you ",
    "Recommended deal for you","Prime offers only for you","",""
  ];

  List<String> offer = [
    "https://m.media-amazon.com/images/G/31/img21/Fashion/Event/Jupiter_21/Wave1/AF_Page/UpdatedHeaders/V1/mob-header-._CB640054984_.gif",
    "https://www.coolztricks.com/wp-content/uploads/2019/09/amazon-great-indian-festival-sale-begins-from-today-201710-1507095470-300x300.jpg",
    "https://m.media-amazon.com/images/G/31/IMG25/Fashion/BAU/Hero/Ingress_1._SX1035_QL85_FMpng_.png",

  ];
}
