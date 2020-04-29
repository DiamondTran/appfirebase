import 'dart:async';
import 'package:appfirebase/src/model/foodAdress.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class DatatypeFood  {
  final String des = "des";
  final String emailuser = "emailuser";
  final String kinhdo = "kinhdo";
  final String name = "name";
  final String namefood = "namefood";
  final String nameuser = "nameuser";
  final String url = "url";
  final String price = "price";
  final String vido = "vido";
  final String date = "date";


  static Future<String> creatFoodadress(
      String type,
      String name,
      String namefood,
      String price,
      String url,
      String des,
      String nameuser,
      String kinhdo,
      String vido,
      String emailuser,  Function onSecces,Function(String) onErr) async {
    var foodadress = <String, dynamic>{
      "name": name,
      "namefood": namefood,
      "price": price,
      "url": url,
      "des": des,
      "nameuser": nameuser,
      "kinhdo": kinhdo,
      "vido": vido,
      "emailuser": emailuser,
      "time": _getDatenow()
    };

    DatabaseReference ref = FirebaseDatabase.instance
        .reference()
        .child("locationfood")
        .child(type)
        .push();
    ref.set(foodadress).then((food){
      onSecces();
    }).catchError((err){
      onErr("Lỗi rồi =.+");
    });
    return ref.key;
  }

  static Future<StreamSubscription<Event>> getFoodAdress(String type, void onData(List<FoodAdress> list)) async{
    StreamSubscription<Event> subscription = FirebaseDatabase.instance.
    reference().child("locationfood")
        .child(type).onValue.listen((Event event){
      List<FoodAdress> list= event.snapshot.value as List;
      if(list== null){
        list=[];
      }
      onData(list);
    });
    return subscription;
  }
  static Future<Query> queryfoddAdress() async{

  }

  Future<List<FoodAdress>> getlocationfood() async{

    DatabaseReference ref =
    FirebaseDatabase.instance.reference().child("locationfood");
    await ref.child("fastfodd").once().then((DataSnapshot snap) {
      List<Map<String, dynamic>> result= snap.value;
      List<FoodAdress> foodAdress = [];
      for (Map<String, dynamic> result in result) {
        foodAdress.add(getFood(result));
      }
      return foodAdress;
    });
  }
  FoodAdress getFood(Map<String, dynamic> result) {
    return FoodAdress(
        result[des],
        result[emailuser],
        result[kinhdo],
        result[name],
        result[namefood],
        result[nameuser],
        result[url],
        result[price],
        result[vido],
        result[date],
     );
  }
}

String _getDatenow() {
  var now = new DateTime.now();
  var fomatDate = new DateFormat('dd-MM-yyyy');
  return fomatDate.format(now);
}
