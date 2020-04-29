import 'package:appfirebase/src/constans/route.dart';
import 'package:appfirebase/src/resources/seach_location.dart';
import 'package:flutter/material.dart';

class RidePicker extends StatefulWidget {
  @override
  _ridePicker createState() => _ridePicker();
}

class _ridePicker extends State<RidePicker> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color(0x88999999), offset: Offset(0, 5), blurRadius: 5)
          ]),
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            width: double.infinity,
            child: FlatButton(
                onPressed: () {
                  Route route = MyRoute(builder:(context)=> ListLocation());
                  Navigator.push(context, route);
                },
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                        height: 50,
                        child: Center(
                          child: Icon(Icons.place),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          top: 0,
                          width: 40,
                          height: 50,
                          child: Center(
                            child: Icon(Icons.close,color: Colors.grey,),
                          )),
                      Padding(padding: EdgeInsets.only(left: 40, right: 50),
                      child: Text("136 Hồ tùng mậu",overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, color: Color(0xff323643)),

                      ),
                      )
                    ],
                  ),
                )
            ),
          ),

        ],
      ),
    );
  }
}
