



import 'dart:math' show Random, pow;

import 'package:flutter/material.dart';

import 'others.dart';

class GW{
  static AppBar returnappbar(BuildContext context)=>AppBar(
    automaticallyImplyLeading: true,

  );

  static Widget button(String str,double w)=>Container(
    width: w-15,
    height: 50,
    decoration: BoxDecoration(
        color: Global.blue,
        borderRadius: BorderRadius.circular(6)
    ),
    child: Center(child: Text(str,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),)),
  );

  static Widget space(double w , double h)=>SizedBox(width: w,height: h,);
  static Widget buildStarRating(int i, {double size = 15, Color filledColor = Colors.orange, Color borderColor = Colors.grey}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < i ? Icons.star : Icons.star_border,
          color: index < i ? filledColor : borderColor,
          size: size,
        );
      }),
    );
  }
  static Widget div()=>Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14.0),
    child: Divider(),
  );

  static String generateRandomNumber(int digits) {
    if (digits <= 0) {
      throw ArgumentError("Digits must be greater than 0");
    }

    final random = Random();
    int min = pow(10, digits - 1).toInt();  // Smallest number with 'digits' digits
    int max = pow(10, digits).toInt() - 1;  // Largest number with 'digits' digits

    return (min + random.nextInt(max - min + 1)).toString();
  }
}