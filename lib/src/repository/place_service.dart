import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:appfirebase/src/model/placeItem.dart';

class PlaceService{
  static Future<List<PlaeceItem>> searchPlace(String keyword) async{
    String url =
        "https://maps.googleapis.com/maps/api/place/textsearch/json?key=" +
            "&language=vi&region=VN&query=" +
            Uri.encodeQueryComponent(keyword);
    var res = await http.get(url);
    if(res.statusCode == 200){
      return PlaeceItem.fromJson(json.decode(res.body));
    }else{
      return new List();
    }
  }
}