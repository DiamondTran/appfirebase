import 'package:flutter/material.dart';

class HeaerderNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(.0),
                Colors.blueAccent.withOpacity(.7),
                Colors.lightBlue.withOpacity(.7),
                Colors.lightBlueAccent
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
              child: Row(
                children: <Widget>[
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      "assets/logodiamondfood.png",
                      scale: 3,
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Text(
                        "Delicious food is everywhere!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1,
                            shadows: [
                              Shadow(
                                  color: Colors.white,
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 12)
                            ]),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
