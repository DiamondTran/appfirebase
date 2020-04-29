import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListLocation extends StatefulWidget {
  @override
  _listLocatino createState() => _listLocatino();
}

class _listLocatino extends State<ListLocation> {
  var _addressCotroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addressCotroller = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xfff8f8f8),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                        height: 60,
                        child: Center(
                          child: Icon(Icons.not_listed_location),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          top: 0,
                          width: 40,
                          height: 60,
                          child: Center(
                            child: FlatButton(
                                onPressed: () {
                                  _addressCotroller.text = "";
                                },
                                child: Icon(Icons.close)),
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 50),
                        child: TextField(
                          controller: _addressCotroller,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (str){},style: TextStyle(fontSize: 16, color: Color(0xff323643)),

                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
