import 'package:flutter/material.dart';

class LoadingDialog{
  static void showLoadingDialog(BuildContext context, String msg){
   showDialog(context: context, barrierDismissible: false, builder: (context){
     return  Dialog(
       shape: RoundedRectangleBorder(
           borderRadius:
           BorderRadius.circular(10.0)
       ),
         child: Container(
           height: 150,
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(30),),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             CircularProgressIndicator(),
             SizedBox(height: 20,),
             Text(msg, style: TextStyle(color: Colors.black, fontSize: 18),)
           ],
         ),
         ),
       );

   });
  }

  static void hideloadingDialog(BuildContext context){
      Navigator.of(context).pop(LoadingDialog);

  }
}