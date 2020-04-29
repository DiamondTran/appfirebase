import 'package:appfirebase/src/resources/splash.dart';
import 'package:flutter/material.dart';

class SplashDetail extends StatefulWidget{
  @override
  _splashdetail createState() => _splashdetail();

}

class _splashdetail extends State<SplashDetail>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
     Navigator.push(context, MaterialPageRoute(builder: (context)=> Splash()));
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/diamondFood.png", height:MediaQuery.of(context).size.height/ 2.5 ,),
          CircularProgressIndicator()
        ],
      )
    );
  }

}