import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jobseeker/main.dart';

class UserManagement{
  storeNewUser(user, context){
    Firestore.instance.collection('/user').add({
      'email' : user.email,
      'uid' : user.uid,
    }).then((value){
      Navigator.of(context).pop();
      Navigator.push(context, 
      new MaterialPageRoute(builder: (BuildContext context)=> MyHomePage()));
      

    }).catchError((e){
      print(e);
    });
  }
}