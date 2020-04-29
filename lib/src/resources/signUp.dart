import 'package:appfirebase/src/constans/dialog/dailogloading.dart';
import 'package:appfirebase/src/constans/dialog/msgdialog.dart';
import 'package:appfirebase/src/constans/route.dart';
import 'package:appfirebase/src/resources/login.dart';
import 'package:appfirebase/src/viewmodel/signupViewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _signUp createState() => _signUp();
}

class _signUp extends State<SignUp> {
  bool ispass = true;
  bool iseye = true;
  bool iseye1 = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final passconfirmController = TextEditingController();
  final phoneController = TextEditingController();
  final singUpViewmodel = SignUpViewModel();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener(() {
      singUpViewmodel.emailSink.add(emailController.text);
    });
    passController.addListener(() {
      singUpViewmodel.passSink.add(passController.text);
    });
    passconfirmController.addListener(() {
      singUpViewmodel.passConfirmSink.add(passconfirmController.text);
    });
    phoneController.addListener(() {
      singUpViewmodel.phonelSink.add(phoneController.text);
    });
    nameController.addListener(() {
      singUpViewmodel.namelSink.add(nameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Image.asset(
                  "assets/car.gif",
                  height: 230,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 28, right: 28),
                child: Image.asset(
                  "assets/taxi.jpg",
                  height: 152,
                ),
              )
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28, right: 28, top: 60),
              child: Column(

                children: <Widget>[
                  SizedBox(height: 90),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 15),
                              blurRadius: 15),
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, -10),
                              blurRadius: 10),
                        ]),
                    child: Padding(

                      padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Registrater",
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: "Poppins-Blod",
                                fontWeight: FontWeight.bold,
                                letterSpacing: 4),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Email*",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    letterSpacing: 2),
                              ),
                              StreamBuilder<String>(
                                  stream: singUpViewmodel.emailStream,
                                  builder: (context, snapshot) {
                                    return TextField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        errorText: snapshot.data,
                                        hintText: "aaaa@gmail.com",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.brown)),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Name*",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    letterSpacing: 2),
                              ),
                              StreamBuilder<String>(
                                  stream: singUpViewmodel.nameStream,
                                  builder: (context, snapshot) {
                                    return TextField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        errorText: snapshot.data,
                                        hintText: "diamond",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.brown)),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Phone number*",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    letterSpacing: 2),
                              ),
                              StreamBuilder<String>(
                                  stream: singUpViewmodel.phonelStream,
                                  builder: (context, snapshot) {
                                    return TextField(
                                      controller: phoneController,
                                      decoration: InputDecoration(
                                        errorText: snapshot.data,
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.brown)),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Password*",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    letterSpacing: 2),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: StreamBuilder<Object>(
                                        stream: singUpViewmodel.passStream,
                                        builder: (context, snapshot) {
                                          return TextField(
                                            controller: passController,
                                            obscureText: ispass,
                                            decoration: InputDecoration(
                                                errorText: snapshot.data,
                                                hintText: "*************",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.brown))),
                                          );
                                        }),
                                  ),
                                  Visibility(
                                      visible: iseye,
                                      child: IconButton(
                                          icon: Icon(Icons.remove_red_eye),
                                          onPressed: () {
                                            setState(() {
                                              ispass = false;
                                              iseye1 = true;
                                              iseye = false;
                                            });
                                          })),
                                  Visibility(
                                      visible: iseye1,
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              ispass = true;
                                              iseye = true;
                                              iseye1 = false;
                                            });
                                          })),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Confirm Password*",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    letterSpacing: 2),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: StreamBuilder<Object>(
                                        stream:
                                            singUpViewmodel.passConfirmStream,
                                        builder: (context, snapshot) {
                                          return TextField(
                                            controller: passconfirmController,
                                            obscureText: ispass,
                                            decoration: InputDecoration(
                                                errorText: passconfirmController
                                                            .text !=
                                                        passController.text
                                                    ? "Not the same as the password"
                                                    : null,
                                                hintText: "*************",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 14),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.brown))),
                                          );
                                        }),
                                  ),
                                  Visibility(
                                      visible: iseye,
                                      child: IconButton(
                                          icon: Icon(Icons.remove_red_eye),
                                          onPressed: () {
                                            setState(() {
                                              ispass = false;
                                              iseye1 = true;
                                              iseye = false;
                                            });
                                          })),
                                  Visibility(
                                      visible: iseye1,
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              ispass = true;
                                              iseye = true;
                                              iseye1 = false;
                                            });
                                          })),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      StreamBuilder<bool>(
                          stream: singUpViewmodel.btnStream,
                          builder: (context, snapshot) {
                            return RaisedButton(
                                onPressed: snapshot.data == true
                                    ? () {
                                        SignUp();
                                      }
                                    : null,
                                color: Colors.brown,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 120,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Text(
                                      "Registrater",
                                      style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ));
                          })
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void SignUp() {
    LoadingDialog.showLoadingDialog(context, "Loading...");

    singUpViewmodel.signUp(emailController.text, passController.text,
        phoneController.text, nameController.text, () {
      LoadingDialog.hideloadingDialog(context);
      Route route = MyRoute1(builder: (context) => Login());
      Navigator.push(context, route);
    }, (msg) {
      LoadingDialog.hideloadingDialog(context);
      MsgDialog.showMsgDialog(context, "Err", msg);
        });
  }
}
