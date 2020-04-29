
import 'package:appfirebase/src/resources/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Auth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void SignUp(String email, String pass, String name, String phone, Function onSucces , Function(String) onErr) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      _createUser(user.user.uid, name, phone, onSucces,onErr);
      print(user);
    }).catchError((err) {
      _onSignUpErr(err.code, onErr);
    });
  }
  void logout(){
    _firebaseAuth.signOut();
  }



  void rote(BuildContext context, Function loadding){
    _firebaseAuth.currentUser().then((user){
      if (user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
      }else{
        loadding();
      }
    });

  }
  _createUser(String userId, String name, String phone, Function onSecces,Function(String) onErr) {
    var user = {"name": name, "phone": phone};
    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userId).set(user).then((user) {
      onSecces();
    }).catchError((err) {
      onErr("SignUp fail, please try again");
    });
  }




  void login(String email, pass, Function onSuccess, Function(String) onerr){
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass).then((user){
      onSuccess();
    }).catchError((err){
      _onSignInErr(err.code,onerr);
    });
  }

  void _onSignUpErr(String code, Function(String) onFuncion){
    switch(code){
      case "ERROR_INVALID_EMAIL":
      case "ERROR_INVALID_CREDENTIAL":
        onFuncion("Invalid email");
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        onFuncion("Email has existed");
        break;
      case "ERROR_WEAK_PASSWORD":
        onFuncion("The password is not strong enough");
        break;
      default:
        onFuncion("SignUp fail, please try again");
        break;
    }
  }
  void _onSignInErr(String code, Function(String) onFuncion){
    switch(code){
      case "ERROR_USER_NOT_FOUND":
        onFuncion("Sign-In fail, please try again");
        break;
      default:
        onFuncion("Password account information is incorrect");
        break;
    }
  }


  static getcreamFood(){
    return FirebaseDatabase.instance.reference().child("locationfood").child("cold food");
  }
  static getdrik() {
    return FirebaseDatabase.instance.reference().child("locationfood").child("drink");
  }
  static getsmoothie(){
    return FirebaseDatabase.instance.reference().child("locationfood").child("smoothie");
  }
  static getfoodcook() {
    return FirebaseDatabase.instance.reference().child("locationfood").child("foodcook");
  }
}
