import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/base.dart';
import 'package:todo/screens/login/Login_with_mvvm/connector.dart';

class LoginViewModel extends BaseViewModel<LoginConnector>{

  Future<void> Login(String email, String password) async {
    try {
      connetor!.showLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await credential.user!.sendEmailVerification();
      if (credential.user?.uid != null) {
        if (credential.user!.emailVerified) {
          connetor!.hideLoading();
          connetor!.goToHome();

        } else {
          connetor!.hideLoading();
          connetor!.showMessage("please verify your email");

        }
        //var user=await readUserFromFirestore(credential.user!.uid);


      }
    } on FirebaseAuthException catch (e) {
      connetor!.hideLoading();
      connetor!.showMessage("${e.message}");
    }
  }

}