import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:appfirebase/src/model/foodAdress.dart';
import 'package:appfirebase/src/resources/foodDetail.dart';
import 'package:appfirebase/src/firebase/typefoodModel.dart';
import 'package:appfirebase/src/viewmodel/getfoodViewModel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class FastFood extends StatefulWidget {
  @override
  _fastFood createState() => _fastFood();
}

class _fastFood extends State<FastFood> {
  List<FoodAdress> listfood = new List();
  StreamSubscription _subscription;

  @override
  void initState() {
    getdata();
//    DatatypeFood.getadress("fastfood", _getdata);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.5),
          borderRadius: BorderRadius.only(topRight: Radius.circular(10))),
      child: listfood.length == 0
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Đợi chút thôi....",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
          ),
          SizedBox(height: 10,),
          CircularProgressIndicator()
        ],
      )
          : GridView.builder(
          itemCount: listfood.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 6, childAspectRatio: 0.7),
          itemBuilder: (BuildContext context, int index) {
            var food= listfood[index];
            return _biuldCard(
                listfood[index].kinhdo,
                listfood[index].vido,
                listfood[index].name,
                listfood[index].namefood,
                listfood[index].url,
                listfood[index].price,
                listfood[index].des,
                listfood[index].emailuser,
                listfood[index].date,
                food,
                context);
          }),
    );
//      ScopedModel(
//        model:GetFoodViewModel.getinstance(),
//        child: WillPopScope(
//            child: Scaffold(
//              body: ScopedModelDescendant<GetFoodViewModel>(
//                builder: (BuildContext context, Widget child, GetFoodViewModel model){
//                  return  GridView.builder(
//                      itemCount: model.listAdress.length,
//                      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//                          crossAxisCount: 2, mainAxisSpacing: 6, childAspectRatio: 0.7),
//                      itemBuilder: (BuildContext context, int index) {
//                        var food= model.listAdress[index];
//                        return _biuldCard(
//                            model.listAdress[index].kinhdo,
//                            model.listAdress[index].vido,
//                            model.listAdress[index].name,
//                            model.listAdress[index].namefood,
//                            model.listAdress[index].url,
//                            model.listAdress[index].price,
//                            model.listAdress[index].des,
//                            model.listAdress[index].emailuser,
//                            model.listAdress[index].date,
//                            food,
//                            context);
//                      });
//
//
//
//                },
//              ),
//            ),
//            onWillPop: (){
//              Navigator.pop(context);
//              GetFoodViewModel.destroyInstance();
//            }
//        ),
//
//      );

  }

  Widget _biuldCard(
      String kinhdo,
      String vido,
      String name,
      String namefood,
      String url,
      String price,
      String des,
      String email,
      String date,
      FoodAdress foodAdress,
      BuildContext context) {
    String resht= "https";
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FoodDetail(
                   food: foodAdress)));
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 10,
          right: 8,
          bottom: 10,
        ),
        decoration: BoxDecoration(boxShadow: [
          new BoxShadow(
            blurRadius: 3,
            color: Colors.black,
            offset: new Offset(3, 3),
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height / 4.8,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:url.contains(resht) ? NetworkImage(url == ""
                              ? "https://i.ytimg.com/vi/3eIWZPxZJjY/maxresdefault.jpg"
                              : url) : MemoryImage(base64.decode(url)),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15))),
                  child: Container(
                    padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 13,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(.7),
                            Colors.black.withOpacity(.0)
                          ]),
                    ),
                    child: FittedBox(
                      child: Text(
                        name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  )),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height / 4.8,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Text(
                            namefood,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          price == "" ? "Đang cập nhật..." : price + " đ",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )
                      ]),
                ))
          ],
        ),
      ),
    );
  }

  void getdata() async {
    DatabaseReference ref =
        FirebaseDatabase.instance.reference().child("locationfood");
    await ref.child("fastfodd").once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      for (var key in keys) {
        listfood.add(FoodAdress(
            data[key]['des'],
            data[key]['emailuser'],
            data[key]['kinhdo'],
            data[key]['name'],
            data[key]['namefood'],
            data[key]['nameuser'],
            data[key]['url'],
            data[key]['price'],
            data[key]['vido'],
            data[key]['time']));
      }
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    if (_subscription != null) {
      _subscription.cancel();
    }
    super.dispose();
  }

  void _getdata(List<FoodAdress> list) {
    listfood = list;
  }
}


