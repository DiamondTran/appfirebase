import 'dart:async';
import 'package:appfirebase/src/repository/place_service.dart';

class SearchPlaceViewModel{
  var _placeController = StreamController();

  void searchPlace(String keyword){
    _placeController.sink.add("start");
    PlaceService.searchPlace(keyword).then((rs){
      _placeController.sink.add(rs);
    }).catchError((){

    });
  }
  void dispose(){
    _placeController.close();
  }
}