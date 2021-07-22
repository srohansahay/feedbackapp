import 'package:feedback_app/pages/final.dart';
import 'package:feedback_app/pages/page1.dart';
import 'package:feedback_app/pages/page2.dart';
import 'package:feedback_app/pages/page3.dart';
import 'package:feedback_app/pages/page4.dart';
import 'package:feedback_app/pages/page5.dart';
import 'package:feedback_app/pages/page6.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(

    initialRoute: '/1',

    routes: {
      '/1' : (context) => page1(),
      '/2' : (context) => page2(),
      '/3' : (context) => page3(),
      '/4' : (context) => page4(),
      '/5' : (context) => page5(),
      '/6' : (context) => page6(),
      '/7' : (context) => finalpage(),
    },

  ));
}

