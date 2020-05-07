import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class MsgDialog{
  static void showMsgDialog(BuildContext context, String title, String msg){
    showDialog(context: context, builder: (context){
      return AlertDialog(
       title: Text(title,),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(onPressed: (){
            Navigator.of(context).pop(MsgDialog);
          }, child: Text("Ok"))
        ],
      );
    });
  }
   static void exitapp(BuildContext context){
    showDialog(context: context,
        builder: (context)=> AlertDialog(
          title: Text("Bạn có chắc chắc muốn thoái ứng dụng?"),
          actions: <Widget>[
            FlatButton(onPressed: ()=> Navigator.pop(context), child: Text("Không")),
            FlatButton(onPressed: ()=> SystemNavigator.pop(), child: Text("Thoát")),

          ],
        )
    );
  }
}