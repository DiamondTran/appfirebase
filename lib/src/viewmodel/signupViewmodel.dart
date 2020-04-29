import 'dart:async';

import 'package:appfirebase/src/constans/vatidater/validation.dart';
import 'package:appfirebase/src/firebase/fire_baseauth.dart';
import 'package:rxdart/rxdart.dart';

class SignUpViewModel {
  var firAuth = Auth();
  final _emailSubject = BehaviorSubject<String>();
  final _passSubject = BehaviorSubject<String>();
  final _passConfirmSubject = BehaviorSubject<String>();
  final _btnSubject = BehaviorSubject<bool>();
  final _phoneSubject = BehaviorSubject<String>();
  final _nameSubject = BehaviorSubject<String>();

  var emailvalidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    sink.add(Validationn.validateEmail(email));
  });
  var passvalidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (pass, sink) {
    sink.add(Validationn.validatePass(pass));
  });
  var phonevalidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (number, sink) {
    sink.add(Validationn.validatePhonenumber(number));
  });
  var namevalidation = StreamTransformer<String, String>.fromHandlers(
      handleData: (name, sink) {
        sink.add(Validationn.validationName(name));
      });

  Stream<String> get phonelStream =>
      _phoneSubject.stream.transform(phonevalidation);

  Sink<String> get phonelSink => _phoneSubject.sink;

  Stream<String> get nameStream =>
      _nameSubject.stream.transform(namevalidation);

  Sink<String> get namelSink => _nameSubject.sink;

  Stream<String> get emailStream =>
      _emailSubject.stream.transform(emailvalidation);

  Sink<String> get emailSink => _emailSubject.sink;

  Stream<String> get passStream =>
      _passSubject.stream.transform(passvalidation);

  Sink<String> get passSink => _passSubject.sink;

  Stream<String> get passConfirmStream => _passConfirmSubject.stream;

  Sink<String> get passConfirmSink => _passConfirmSubject.sink;

  Sink<bool> get btnSink => _btnSubject.sink;

  Stream<bool> get btnStream => _btnSubject.stream;

  SignUpViewModel() {
    Observable.combineLatest5(_emailSubject, _passSubject, _passConfirmSubject,
        _phoneSubject, _nameSubject, (email, pass, passconfirm, number, name) {
      return Validationn.validateEmail(email) == null &&
          Validationn.validatePass(pass) == null &&
          Validationn.validattpasscomfirm(passconfirm, pass) == null &&
          Validationn.validatePhonenumber(number) == null &&
          Validationn.validationName(name) == null;
    }).listen((enable) {
      btnSink.add(enable);
    });
  }

  void signUp(String email, String pass, String phone, String name,
      Function onSuccess,Function(String) onErr) {
    firAuth.SignUp(email, pass, name, phone, onSuccess,onErr);
  }

  dispose() {
    _emailSubject.close();
    _passSubject.close();
    _btnSubject.close();
    _passConfirmSubject.close();
    _phoneSubject.close();
    _nameSubject.close();
  }
}
