import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:zook/Global/others.dart';
import 'package:zook/navigation/home.dart';
import 'package:zook/navigation/orders.dart';
import 'package:zook/navigation/products.dart';
import 'package:zook/navigation/profile.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selected = 0;
  bool heart = false;
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
        onTap: (index) {
          if (index == selected) return;
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            heart = !heart;
          });
        },
        backgroundColor: Colors.white,
        child: Icon(
          heart ? CupertinoIcons.add : CupertinoIcons.add_circled_solid,
          color:  Global.blue
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawerEnableOpenDragGesture: false,endDrawerEnableOpenDragGesture: false,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: [
            Home(),
            Orders(),
            Products(),
            Profile()
          ],
        ),
      ),
    );
  }
}
