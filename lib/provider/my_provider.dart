import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/shared/firebase/firebase_function.dart';

import '../models/user_model.dart';

class MyProvider extends ChangeNotifier{
  UserModel? userModel;
  User? firebaseUser;

  MyProvider(){
    firebaseUser=FirebaseAuth.instance.currentUser;
if(firebaseUser!=null){
  initUser();
}


  }
  initUser()async{
    firebaseUser=FirebaseAuth.instance.currentUser;
    userModel=await FirebaseFunction.readUserFromFirestore(firebaseUser!.uid);
    notifyListeners();
  }

}