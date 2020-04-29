import 'package:appfirebase/src/constans/dialog/dailogloading.dart';
import 'package:appfirebase/src/constans/dialog/msgdialog.dart';
import 'package:appfirebase/src/constans/route.dart';
import 'package:appfirebase/src/resources/home.dart';
import 'package:appfirebase/src/viewmodel/loginViewModel.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _login createState() => _login();
}

class _login extends State<Login> {

  bool ispass = true;
  bool iseye = true;
  bool iseye1 = false;
  final emailcotroller = TextEditingController();
  final passcotroller = TextEditingController();
  final loginviewModel = LoginViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailcotroller.addListener(() {
      loginviewModel.emailSink.add(emailcotroller.text);
    });
    passcotroller.addListener(() {
      loginviewModel.passSink.add(passcotroller.text);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loginviewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    "assets/as.png",
                    height: 200,
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 28, right: 28, top: 60),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 180),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 3,
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
                        padding: EdgeInsets.only(top: 7, right: 16, left: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Login",
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
                                  "Username",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      letterSpacing: 2),
                                ),
                                StreamBuilder<String>(
                                    stream: loginviewModel.emailStream,
                                    builder: (context, snapshot) {
                                      return TextField(
                                        controller: emailcotroller,
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
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      letterSpacing: 2),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: StreamBuilder<String>(
                                          stream: loginviewModel.passStream,
                                          builder: (context, snapshot) {
                                            return TextField(
                                              controller: passcotroller,
                                              obscureText: ispass,
                                              decoration: InputDecoration(
                                                  errorText: snapshot.data,
                                                  hintText: "*************",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .brown))),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text("Forgot password",
                                    style: TextStyle(
                                      color: Colors.brown,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                      decoration: TextDecoration.underline,
                                    ))
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
                            stream: loginviewModel.btnStream,
                            builder: (context, snapshot) {
                              return RaisedButton(
                                  onPressed: snapshot.data == true
                                      ? () {
                                    signIn();
                                        }
                                      : null,
                                  color: Colors.brown,
                                  elevation: 15,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: 120,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Text(
                                        "SignIn",
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
                    SizedBox(height: MediaQuery.of(context).size.height / 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 8,
                            height: 1,
                            color: Colors.black.withOpacity(.2),
                          ),
                        ),
                        Text(
                          "Social Login",
                          style: TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 8,
                            height: 1,
                            color: Colors.black.withOpacity(.2),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 1),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(1, 5),
                                      blurRadius: 10),
                                ],
                              ),
                              child: CircleAvatar(
                                  backgroundImage: AssetImage("assets/fa.png")),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(1, 5),
                                      blurRadius: 10),
                                ],
                              ),
                              child: CircleAvatar(
                                  backgroundImage: AssetImage("assets/go.png")),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
  void signIn(){
    String email= emailcotroller.text;
    String pass= passcotroller.text;
    LoadingDialog.showLoadingDialog(context, "Đợi chút đang vào....");

    loginviewModel.signIn(email, pass, (){
      LoadingDialog.hideloadingDialog(context);
      Route route = MyrouteDuration(widget: MyHomePage());
      Navigator.push(context, route);

    }, (msg){
      LoadingDialog.hideloadingDialog(context);
      MsgDialog.showMsgDialog(context, "Err", msg);
    });
  }
}
