import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadImage{
 static uploadImage(File templeImage) async{
    final StorageReference postimage= FirebaseStorage.instance.ref().child("PostImage");
    var timekey = DateTime.now();
    final StorageUploadTask uploadTask= postimage.child(timekey.toString()+".jpg").putFile(templeImage);
    var imageur= await(await uploadTask.onComplete).ref.getDownloadURL();
    String url = imageur.toString();
    return url;
  }
}