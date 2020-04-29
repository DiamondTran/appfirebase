import 'package:appfirebase/src/constans/route.dart';
import 'package:appfirebase/src/firebase/fire_baseauth.dart';
import 'package:appfirebase/src/resources/location.dart';
import 'package:appfirebase/src/resources/login.dart';
import 'package:appfirebase/src/resources/widget/addFood.dart';
import 'package:appfirebase/src/resources/widget/home_page.dart';
import 'package:appfirebase/src/resources/widget/profile.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  String title = "Diamond";
  int index = 0;
 Auth auth= Auth();
   var color= Colors.white;
  var colo2= Colors.transparent;
  var pageOption = [
    HomePage(),
    AddFood(),
    Profile(),
    Locationfood(),
  ];
    void selectOption(int i, String title1, Color color1,Color Colorappar){
        setState(() {
          index= i;
          title= title1;
          color= color1;
          colo2= Colorappar;
        });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            pageOption[index],
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Column(
                children: <Widget>[
                  AppBar(
                    backgroundColor: colo2,
                    elevation: 0.0,
                    title: Text(
                      title,
                      style: TextStyle(color: color, letterSpacing: 1, fontWeight: FontWeight.w600),
                    ),
                    leading: FlatButton(
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          color: color,
                        )),
                    actions: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: color,
                          ),
                          onPressed: () {})
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_box),
            onTap: () {
              selectOption(0, "Home", Colors.white, Colors.transparent);
              Navigator.pop(context);
            },
            title: Text(
              "Home",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.pin_drop,color: Colors.lightBlue),
            onTap: () {
              selectOption(1, "Thêm một địa chỉ mới", Colors.white,Colors.brown.withOpacity(.8));
              Navigator.pop(context);
            },
            title: Text(
              "Thêm địa điểm ăn",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            onTap: () {
              selectOption(2, "Profile", Colors.black, Colors.grey);
              Navigator.pop(context);
            },
            title: Text(
              "Profile",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.map),
            onTap: () {
              selectOption(3, "Store Food", Colors.black, Colors.transparent);
              Navigator.pop(context);
            },
            title: Text(
              "Location store food",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              auth.logout();
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));

            },
            title: Text(
              "Đăng xuất",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
        ],
      )),
    );
  }
}
