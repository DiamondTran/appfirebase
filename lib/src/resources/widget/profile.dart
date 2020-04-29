import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Profile extends StatefulWidget{
  @override
  _profile createState()=> _profile();

}
class _profile extends State<Profile>{
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firebaseAuth.currentUser().then((user){
      print(user.email);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Text("aduadj"),
      ),
    );
  }

}