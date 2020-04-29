import 'dart:async';
import 'package:appfirebase/src/constans/vatidater/validateAddFood.dart';
import 'package:appfirebase/src/firebase/fire_baseauth.dart';
import 'package:rxdart/rxdart.dart';

class AddFoodViewModel {
  var firAuth = Auth();
  final _nameSubject = BehaviorSubject<String>();
  final _namefoddSubject = BehaviorSubject<String>();
  final _priceSubject = BehaviorSubject<String>();
  final _descritionSubject = BehaviorSubject<String>();
  final _tyoeSubject = BehaviorSubject<String>();
  final _btnSubject = BehaviorSubject<bool>();

//  final _nameuserSubject = BehaviorSubject<String>();
//  final _kinhdoSubject = BehaviorSubject<String>();
//  final _vidoSubject = BehaviorSubject<String>();
//  final _emailuserSubject = BehaviorSubject<String>();

  var namevalidation =
  StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    sink.add(ValidateFood.validate(name));
  });
  var namefoodvalidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (food, sink) {
    sink.add(ValidateFood.validate(food));
  });
  var pricevalidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (price, sink) {
    sink.add(ValidateFood.validate(price));
  });
  var descrioValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (des, sink) {
    sink.add(ValidateFood.validate(des));
  });
  var typeValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (type, sink) {
    sink.add(ValidateFood.validate(type));
  });

  Stream<String> get nameStream =>
      _nameSubject.stream.transform(namevalidation);

  Sink<String> get nameSink => _nameSubject.sink;

  Stream<String> get foodStream =>
      _namefoddSubject.stream.transform(namefoodvalidation);

  Sink<String> get foodSink => _namefoddSubject.sink;

  Stream<String> get priceStream =>
      _priceSubject.stream.transform(pricevalidation);

  Sink<String> get priceSink => _priceSubject.sink;

  Stream<String> get desStream =>
      _priceSubject.stream.transform(descrioValidation);

  Sink<String> get desSink => _descritionSubject.sink;

  Stream<String> get typeStream =>
      _priceSubject.stream.transform(typeValidation);

  Sink<String> get typeSink => _tyoeSubject.sink;

  Stream<bool> get btnStream => _btnSubject.stream;

  Sink<bool> get btnSink => _btnSubject.sink;

//  Stream<String> get nameuserStream => _nameuserSubject.stream;
//  Sink<String> get nameuserSink=> _nameuserSubject.sink;
//
//  Stream<String> get kinhdoStream => _kinhdoSubject.stream;
//  Sink<String> get kinhdoSink => _kinhdoSubject.sink;
//
//  Stream<String> get vidoStream => _vidoSubject.stream;
//  Sink<String> get vidoSinl=> _vidoSubject.sink;
//
//  Stream<String> get emailuserStream => _emailuserSubject.stream;
//  Sink<String> get emailuserSink => _emailuserSubject.sink;

  AddFoodViewModel() {
    Observable.combineLatest5(_nameSubject, _namefoddSubject, _priceSubject,
        _tyoeSubject, _descritionSubject, (name, namefood, price, type, des) {
      return ValidateFood.validate(name) == null &&
          ValidateFood.validate(namefood) == null &&
          ValidateFood.validate(price) == null &&
          ValidateFood.validate(type) == null &&
          ValidateFood.validate(des) == null;
    }).listen((enable) {
      btnSink.add(enable);
    });
  }



  void dispose() {
    _nameSubject.close();
    _namefoddSubject.close();
    _priceSubject.close();
    _descritionSubject.close();
    _btnSubject.close();
//    _nameuserSubject.close();
//    _kinhdoSubject.close();
//    _vidoSubject.close();
//    _emailuserSubject.close();
  }
}
