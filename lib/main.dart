import 'package:art_board/Boy/Boy_Screen.dart';
import 'package:art_board/Google_Maps.dart';
import 'package:art_board/Order_List.dart';
import 'package:art_board/getImages.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'Splash_Screen.dart';

void main()=> runApp(MyApp());


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Art Board',
      theme: ThemeData(
        primarySwatch: Colors.grey
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
