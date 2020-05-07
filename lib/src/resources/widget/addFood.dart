import 'dart:io';
import 'package:appfirebase/src/firebase/typefoodModel.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:appfirebase/src/constans/dialog/dailogloading.dart';
import 'package:appfirebase/src/constans/dialog/msgdialog.dart';
import 'package:appfirebase/src/constans/listDropmenuItem.dart';
import 'package:appfirebase/src/viewmodel/addFoodViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as Io;
import 'dart:convert';


class AddFood extends StatefulWidget {
  @override
  _addFood createState() => _addFood();
}

class _addFood extends State<AddFood> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String emailuser="";
  bool ischeck = false;
  String url="";
  String selected = null;
  File file;
  String kinhdo="";
  String vido="";
  Random random = new Random();
  String uid ="";
   final nameController = TextEditingController();
   final nameFoodcontroller = TextEditingController();
   final pricecontroller = TextEditingController();
   final desController = TextEditingController();
   final addViewModel= AddFoodViewModel();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.addListener((){
      addViewModel.nameSink.add(nameController.text);
    });
    nameFoodcontroller.addListener((){
      addViewModel.foodSink.add(nameFoodcontroller.text);
    });
    pricecontroller.addListener((){
      addViewModel.priceSink.add(pricecontroller.text);
    });
    desController.addListener((){
      addViewModel.desSink.add(desController.text);
    });
//    getuid();
    _firebaseAuth.currentUser().then((user){
      setState(() {
        emailuser= user.email;
      });
    });

  }
//  void getuid(){
//    var i = _randomId();
//    uid =i.toString();
//
//}

  Future<bool> _onbackPress(){
    return showDialog(context: context,
builder: (context)=> AlertDialog(
  title: Text("Bạn có chắc chắc muốn thoái ứng dụng?"),
  actions: <Widget>[
    FlatButton(onPressed: ()=> Navigator.pop(context, false), child: Text("Không")),
    FlatButton(onPressed: ()=> SystemNavigator.pop(), child: Text("Thoát")),

  ],
)
    );
  }
  @override
  Widget build(BuildContext context) {
    ListDropMenuItem.loadData();
    // TODO: implement build
    return WillPopScope(
      onWillPop: _onbackPress,
       child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/didiem.jpg"), fit: BoxFit.cover)),
              ),
              SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 130, left: 20, right: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 1.4,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.7),
                              borderRadius: BorderRadius.circular(10),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child:   Padding(
                                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                                  child: Text(
                                    "Cùng chia sẻ địa điểm ăn ngon cho mọi người nhé ^.^",
                                    style: TextStyle(
                                        color: Colors.brown,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                              Expanded(child:  Padding(padding: EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      child: file == null
                                          ? Text('Chọn ảnh đi bạn eeiii !', style: TextStyle(fontWeight: FontWeight.w700),)
                                          : Image.file(file,height: 100, width: 100,),
                                    ),
                                    FlatButton(onPressed: (){
                                      getImage();
                                    }, child: Material(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.brown[400],
                                      elevation: 7,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 80,
                                        child: Text("Chọn ảnh", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                      ),
                                    ))
                                  ],
                                ),
                              ),),
                              Expanded(child:   Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: StreamBuilder<Object>(
                                    stream: addViewModel.nameStream,
                                    builder: (context, snapshot) {
                                      return TextField(
                                        controller: nameController,
                                        style: TextStyle(
                                            color: Colors.black87, letterSpacing: 1),
                                        decoration:
                                        InputDecoration(labelText: "Tên địa điểm",errorText: snapshot.data),
                                      );
                                    }
                                ),
                              ),),
                              Expanded(child:  Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: StreamBuilder<Object>(
                                    stream: addViewModel.foodStream,
                                    builder: (context, snapshot) {
                                      return TextField(
                                        controller: nameFoodcontroller,
                                        style: TextStyle(
                                            color: Colors.black87, letterSpacing: 1),
                                        decoration: InputDecoration(labelText: "Tên món ăn",errorText: snapshot.data),
                                      );
                                    }
                                ),
                              ),),
                              Expanded(child:  Padding(
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: DropdownButton(
                                      value: selected,
                                      hint: Text("Chọn loại"),
                                      items: ListDropMenuItem.listDrop,
                                      onChanged: (value) {
                                        setState(() {
                                          selected= value;
                                          addViewModel.typeSink.add(value);
                                        });
                                      })),),
                              Expanded(child:  Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: StreamBuilder<Object>(
                                    stream: addViewModel.priceStream,
                                    builder: (context, snapshot) {
                                      return TextField(
                                        controller: pricecontroller,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                            color: Colors.black87, letterSpacing: 1),
                                        decoration: InputDecoration(labelText: "Giá",errorText: snapshot.data),
                                      );
                                    }
                                ),
                              ),),

                              Expanded(flex: 2,
                                child:  Padding(
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: StreamBuilder<Object>(
                                      stream: addViewModel.desStream,
                                      builder: (context, snapshot) {
                                        return TextField(
                                          controller: desController,
                                          style: TextStyle(
                                              color: Colors.black87, letterSpacing: 1),
                                          maxLines: 4,
                                          decoration: InputDecoration(
                                              labelText: "Vài dòng nhận xét",
                                              errorText: snapshot.data,
                                              border: OutlineInputBorder()),
                                        );
                                      }
                                  ),
                                ),),
                              Expanded(child:   Padding(
                                  padding: EdgeInsets.only(top: 1),
                                  child: Row(
                                    children: <Widget>[
                                      Checkbox(
                                          value: ischeck,
                                          onChanged: (bool value) {
                                            setState(() {
                                              ischeck = value;
                                            });
                                          }),
                                      Text(
                                        "Lấy vị trí hiện tại bạn đang đứng",
                                        style: TextStyle(
                                            color: Colors.brown,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      )
                                    ],
                                  )),)


                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:20,left: 10, right: 10),
                          child: StreamBuilder<Object>(
                              stream: addViewModel.btnStream,
                              builder: (context, snapshot) {
                                return RaisedButton(
                                  color: Colors.brown[500],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 7,
                                  onPressed:snapshot.data ==true ? () { Location();}: null,
                                  child: Container(
                                    height: 50,
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    child: Text(
                                      "Thêm",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2),
                                    ),
                                  ),
                                );
                              }
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        )
    );
  }

// _randomId(){
//    int randomNumber = random.nextInt(100000000);
//    int randomNumber1 = random.nextInt(10000);
//    int i= randomNumber*randomNumber1;
//    return i;
//  }
  void _createFoodAdress(String kinhdo, String vido){
    uploadImage(file);

    String name= nameController.text;
    String namefood= nameFoodcontroller.text;
    String price= pricecontroller.text;
    String des= desController.text;
    LoadingDialog.showLoadingDialog(context, "Loading...");
    DatatypeFood.creatFoodadress(selected, name, namefood,price,url, des,"", kinhdo, vido,emailuser,(){
      LoadingDialog.hideloadingDialog(context);
      MsgDialog.showMsgDialog(context, "Báo cho bạn biết", "Đã thêm rồi ^^");
    },(msg){
      LoadingDialog.hideloadingDialog(context);
      MsgDialog.showMsgDialog(context, "Err", msg);
    });


  }

  uploadImage(File templeImage) async{
    List<int> imageBytes = templeImage.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
          setState(() {
            url= base64Image;
          });
  }
  void getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      file= image;
    });
  }
  void Location() async {
    final positon= await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      kinhdo= positon.longitude.toString();
      vido= positon.latitude.toString();
     ischeck? _createFoodAdress(kinhdo, vido): _createFoodAdress("","");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    addViewModel.dispose();
    super.dispose();

  }
}

