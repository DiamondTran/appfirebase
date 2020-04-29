import 'package:appfirebase/src/resources/tapbar/hearderTapbar/newpage.dart';
import 'package:flutter/material.dart';

class NewPageFood extends StatefulWidget{
  @override
  _newPageFood createState() =>_newPageFood();
}

class _newPageFood extends State<NewPageFood>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height:  MediaQuery.of(context).size.height/ 2.2,
                    child:   HeaerderNewPage(),

                  )),


            ],
          )


      ),
    );
  }

}