
import 'package:appfirebase/src/constans/route.dart';
import 'package:appfirebase/src/firebase/fire_baseauth.dart';
import 'package:appfirebase/src/resources/home.dart';
import 'package:appfirebase/src/resources/login.dart';
import 'package:appfirebase/src/resources/signUp.dart';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _splash createState() => _splash();
}

class _splash extends State<Splash> {
  bool isgifcar = false;
 Auth auth = Auth();
  bool isquay = true;
  bool isbuton= false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   auth.rote(context, delay);
  }

  void delay(){
    Future.delayed(Duration(milliseconds: 1600), () {
      setState(() {
        isgifcar = true;
      });
    });
    Future.delayed(Duration(milliseconds: 3800), () {
      setState(() {
        isquay = false;
        isbuton= true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/aaaaaaaa.png'),
            Visibility(
              visible: isgifcar,
              child: Image.asset(
                'assets/gifcar.gif',
                height: 200,
              ),
            ),
            Visibility(visible: isquay, child: CircularProgressIndicator()),
            Visibility(
              visible: isbuton,
                child: Column(
              children: <Widget>[
                RaisedButton(
                  color: Colors.red[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                        ),
                    elevation: 7.0,
                    onPressed: () {Route route= MyrouteDuration(widget: Login());
                    Navigator.push(context, route);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 50,
                      child: Text("Đăng nhập", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)),
                    ))
              ],
            )),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: isbuton,
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                        color: Colors.red[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                        elevation: 7.0,
                        onPressed: () {Route route= MyRoute(builder: (context)=> SignUp());
                        Navigator.push(context, route);},
                        child: Container(
                          alignment: Alignment.center,
                          width: 200,
                          height: 50,
                          child: Text("Đăng kí", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)),
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
