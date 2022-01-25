//Degano Riccardo 24/01/2022
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mhw/main.dart';



class Splash extends StatefulWidget {
  Splash();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        // ignore: prefer_const_constructors
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            // ignore: prefer_const_constructors
            builder: (BuildContext context) => MyHomePage(title: 'Moster Hunter',))));           
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     // backgroundColor: Colors.white,
      body: Center(
        
        //child: Image.file('/imag/splash.jpg', fit: BoxFit.fill,),
        child: Container ( 
          // ignore: prefer_const_constructors
          child: Text( 'Moster Hunter API', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)))
      ),
      
      
    );
  }
}