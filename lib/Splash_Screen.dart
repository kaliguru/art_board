import 'dart:async';

import 'package:art_board/LoginScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  outTimer()
  {
    Timer(Duration(seconds: 2), () async{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c)=>LoginScreen()), (route) => false);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    outTimer();
  }

  @override
  Widget build(BuildContext context) {


    return Material(
      child: Scaffold(
        body: SafeArea(
          child: Expanded(
            child: Align(
              child: Icon(Icons.abc,size: 200,),
              
            ),
          ),
        ),

      ),
    );
  }
}
