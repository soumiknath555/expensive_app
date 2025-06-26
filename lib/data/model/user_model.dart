import 'package:flutter/foundation.dart';

class UserModel {

  int? id;
  String name;
  String email;
  String mobNo;
  String pass ;
 UserModel({
   this.id,
   required this.name,
   required this.email,
   required this.mobNo,
   required this.pass,
});

 /// convert map into model......
 factory UserModel.fromMap(Map<String,dynamic> map){
   return UserModel(
       name: name,
       email: email,
       mobNo: mobNo,
       pass: pass
   );
 }

/// convert model into map ......



}