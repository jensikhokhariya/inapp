import 'package:flutter/material.dart';
import 'package:inapp/screen/webpage_s.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>Webpage_S(),
      },
    ),
  );
}
