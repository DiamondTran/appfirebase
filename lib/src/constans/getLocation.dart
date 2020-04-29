import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
class Getlocation{

  final _kinhdo = BehaviorSubject<String>();
  final _vido = BehaviorSubject<String>();

  Stream<String> get kinhdoStream => _kinhdo.stream;
  Sink<String> get kinhdoSink => _kinhdo.sink;

  Stream<String> get vidoStream => _vido.stream;
  Sink<String> get vidoSink => _vido.sink;


    getlocation() async {
    final positon= await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var kinhdo= positon.longitude.toString();
    var vido= positon.altitude.toString();
    kinhdoSink.add(kinhdo);
    vidoSink.add(vido);

  }


  void dispose(){
    _kinhdo.close();
    _vido.close();
  }
}