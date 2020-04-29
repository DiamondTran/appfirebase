

import 'package:appfirebase/src/resources/splash.dart';
import 'package:appfirebase/src/resources/splashDetail.dart';
import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: SplashDetail(),
    );
  }
}