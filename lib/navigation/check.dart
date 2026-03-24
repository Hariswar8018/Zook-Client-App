import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:zook/Global/global_model.dart';
import 'package:zook/admin/navigation.dart';
import 'package:zook/login/create.dart';
import 'package:zook/navigation/seller_bloc/event.dart';
import 'package:zook/navigation/seller_bloc/state.dart';
import 'package:zook/navigation/seller_bloc/view.dart';

import '../Global/others.dart';
import 'naviagtion.dart' show Navigation;

class SellerCheckScreen extends StatelessWidget {
  final String email;

   SellerCheckScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return email=="brnrinnovations@gmail.com"||email=="samasiasahi14@gmail.com"?NavAdmin():BlocProvider(
      create: (_) => SellerBloc(SellerRepository())..add(CheckSellerEvent(email)),
      child: BlocListener<SellerBloc, SellerState>(
        listener: (context, state) {
          if (state is SellerExists) {
            Session.seller=state.seller;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Navigation()),
            );
          } else if (state is SellerNotFound) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => CreateSeller()),
            );
          } else if (state is SellerError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Scaffold(
          body: Center(
            child: BlocBuilder<SellerBloc, SellerState>(
              builder: (context, state) {
                if (state is SellerLoading || state is SellerInitial) {
                  return loading(w,false);
                }
                return loading(w, true);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget loading(double w,bool on){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
      ),
      extendBody: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          Container(
            width: w,
            height: w/4+50,
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.white,
                child:ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: w/2-10,
                        height: w/4+50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    );
                  },

                )
            ),
          ),
          SizedBox(height: 15,),
          on?Center(
            child: Container(
                height: 300,
                width: w-20,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 3,),
                    Text("Updating your Account",style: TextStyle(color: Global.blue,fontSize: 18,fontWeight: FontWeight.w800),),
                    Text("It would take a Second ! Hang On",style: TextStyle(color: Global.blue,fontSize: 15),),
                  ],
                )
            ),
          ):Center(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.white,
              child: Container(
                height: 300,
                width: w-20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)
                ),
              )
            ),
          ),
          SizedBox(height: 15,),
          Center(
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                child: Container(
                  height: 40,
                  width: w-20,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(1)
                  ),
                )
            ),
          ),
          SizedBox(height: 15,),
          Container(
            width: w,
            height: w/4+50,
            child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.white,
                child:ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: w/3-10,
                        height: w/4+50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    );
                  },

                )
            ),
          ),
        ],
      ),
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          iconStyle: IconStyle.animated,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(Icons.house_outlined),
            selectedIcon:  Icon(Icons.house_rounded,color: Global.blue,),
            selectedColor: Global.blue,
            unSelectedColor: Colors.grey,
            title: const Text('Home'),
            badgeColor: Colors.purple,
            badgePadding: const EdgeInsets.only(left: 4, right: 4),
          ),
          BottomBarItem(
            icon: const Icon(Icons.local_shipping),
            selectedIcon:  Icon(Icons.local_shipping,color: Global.blue),
            selectedColor: Global.blue,
            title: const Text('Orders'),
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.card_giftcard_sharp,
              ),
              selectedIcon: Icon(
                  Icons.card_giftcard,color: Global.blue
              ),
              selectedColor: Global.blue,
              title: const Text('Products')),
          BottomBarItem(
              icon: const Icon(
                Icons.person_outline,
              ),
              selectedIcon: Icon(
                  Icons.person,color: Global.blue
              ),
              selectedColor: Global.blue,
              title: const Text('Profile')),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected,
        notchStyle: NotchStyle.square,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {  },
        child: Icon(
            heart ? CupertinoIcons.add : CupertinoIcons.add_circled_solid,
            color:  Global.blue
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawerEnableOpenDragGesture: false,endDrawerEnableOpenDragGesture: false,

    );
  }
  bool heart = false; int selected=0;
}
