import 'dart:async';
import 'package:appfirebase/src/constans/vatidater/validation.dart';
import 'package:appfirebase/src/firebase/fire_baseauth.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel {
  var firAuth = Auth();
  final _emailSubject = BehaviorSubject<String>();
  final _passSubject = BehaviorSubject<String>();
  final _btnSubject = BehaviorSubject<bool>();

  var emailvalidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    sink.add(Validationn.validateEmail(email));
  });
  var passvalidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    sink.add(Validationn.validatePass(pass));
  });

  Stream<String> get emailStream =>
      _emailSubject.stream.transform(emailvalidation);

  Sink<String> get emailSink => _emailSubject.sink;

  Stream<String> get passStream =>
      _passSubject.stream.transform(passvalidation);

  Sink<String> get passSink => _passSubject.sink;

  Sink<bool> get btnSink => _btnSubject.sink;

  Stream<bool> get btnStream => _btnSubject.stream;

  LoginViewModel() {
    Observable.combineLatest2(_emailSubject, _passSubject, (email, pass) {
      return Validationn.validateEmail(email) == null &&
          Validationn.validatePass(pass) == null;
    }).listen((enable) {
      btnSink.add(enable);
    });
  }

  void signIn(
      String email, String pass, Function success, Function(String) pnErr) {
    firAuth.login(email, pass, success, pnErr);
  }

  dispose() {
    _emailSubject.close();
    _passSubject.close();
    _btnSubject.close();
  }
}
