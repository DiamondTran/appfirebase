import 'package:appfirebase/src/constans/getLocation.dart';
import 'package:flutter/material.dart';
import 'package:appfirebase/src/resources/widget/ride_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Locationfood extends StatefulWidget{
  @override
  _locationFood createState() => _locationFood();

}

class _locationFood extends State<Locationfood>{
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  double kinhdo=0;
  double vido=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Location();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      key: _scaffoldKey,
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(kinhdo, vido ),
                zoom: 14.4746,
              ),
            ),
            Positioned(
              left: 0,
              top: 80,
              right: 0,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child:  RidePicker()
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void Location() async {
    final positon= await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      kinhdo= positon.longitude;
      vido= positon.altitude;

    });

  }
}