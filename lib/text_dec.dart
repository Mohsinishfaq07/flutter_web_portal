import 'package:flutter/material.dart';

import 'colors.dart';


Column textDesc(BuildContext context) {

    Size _size = MediaQuery.of(context).size;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
          height:  _size.width > 1200
              ? 320
              : _size.width > 1000
              ? 240
              : _size.width > 900
              ? 220
              : _size.width > 800
              ? 200
              : _size.width > 750
              ? 180
              : _size.width > 700
              ? 160
              : _size.width > 650
              ? 140
              : 0,

        // height: _size.width > 1300 ? 200:50,
          child: Image.asset("assets/images/png/ic_ais_logo.png")),
       const SizedBox(
        height: 10,
      ),
       Text(
        'Seat Management System',
        style: TextStyle(
          color: primaryColor,
          fontSize: _size.width > 1200
              ? 36
              : _size.width > 1000
              ? 30
              : _size.width > 900
              ? 26
              : _size.width > 800
              ? 22
              : _size.width > 750
              ? 20
              : _size.width > 700
              ? 16
              : _size.width > 650
              ? 14
              : 0,
          fontWeight: FontWeight.bold,
        ),
      ),
      // const SizedBox(
      //   height: 6,
      // ),
       Text(
         "Very Simple & Fast Tracking Solution "
             "For Your Company",
         style: TextStyle(
           color:  Colors.grey.shade800  ,
           fontSize: _size.width > 1200
               ? 20
               : _size.width > 1000
               ? 18
               : _size.width > 900
               ? 16
               : _size.width > 800
               ? 14
               : _size.width > 750
               ? 12
               : _size.width > 700
               ? 10
               : _size.width > 650
               ? 8
               : 0,
           fontWeight: FontWeight.bold,
         ),
       ),
    ],
  );
}
