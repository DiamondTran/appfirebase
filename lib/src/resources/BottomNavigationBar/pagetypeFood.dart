import 'package:appfirebase/src/resources/BottomNavigationBar/favourite.dart';
import 'package:appfirebase/src/resources/tapbar/hearderTapbar/favourite.dart';
import 'package:appfirebase/src/resources/tapbar/hearderTapbar/news.dart';
import 'package:appfirebase/src/resources/tapbar/pageTabbar/cream.dart';
import 'package:appfirebase/src/resources/tapbar/pageTabbar/drink.dart';
import 'package:appfirebase/src/resources/tapbar/pageTabbar/eatwell.dart';
import 'package:appfirebase/src/resources/tapbar/pageTabbar/fastFood.dart';
import 'package:appfirebase/src/resources/tapbar/pageTabbar/smoothie.dart';
import 'package:flutter/material.dart';

class PageTypeFood extends StatefulWidget{
  @override
  _pagetypeFood createState()=> _pagetypeFood();

}
class _pagetypeFood extends State<PageTypeFood>with SingleTickerProviderStateMixin{
  TabController _tabcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabcontroller = TabController(length: 5, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image.jpg"), fit: BoxFit.cover)),
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height:  MediaQuery.of(context).size.height/ 2.2,
                child: HeaerderNews(),

              )),

          Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 8,
                right: 10,
                left: 10,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  SizedBox(
                      height: 38,
                      child: TabBar(controller: _tabcontroller,
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              color: Colors.white.withOpacity(.5)
                          ),
                          tabs: <Widget>[
                            Tab(
                                child: Container(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text("FastFood", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18)),
                                )
                            ),
                            Tab(
                                child: Container(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text("Smoothie", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18)),
                                )
                            ),

                            Tab(
                                child: Container(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text("Cream", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18)),
                                )
                            ),
                            Tab(
                                child: Container(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text("Drink", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18)),
                                )
                            ),
                            Tab(
                                child: Container(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text("Eat well", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18)),
                                )
                            ),
                          ])),
                  Expanded(
                      child: TabBarView(
                          controller: _tabcontroller,
                          children: [FastFood(), Smoothie(),Cream(),Drink(),Eatwell()]))
                ],
              )),

        ],
      ),
    );
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabcontroller.dispose();
  }
}