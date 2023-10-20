import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';

import '../../models/user_model.dart';

class FirebaseFunction {
  //CollectionReference<TaskModel> as return type of withConverter
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static Stream<QuerySnapshot<TaskModel>> GetTask(DateTime datetime) {
    return getTaskCollection()
        .where("date",
        isEqualTo: DateUtils
            .dateOnly(datetime)
            .millisecondsSinceEpoch)
        .snapshots();
  }

  static void deleteTask(String id) {
    getTaskCollection().doc(id).delete();
  }

  static void updateTask(TaskModel task) {
    getTaskCollection().doc(task.id).update(task.toJson());
  }

  static Future<void> addTask(TaskModel taskModel) {
    var collection = getTaskCollection(); // create table
    var docRef = collection.doc(); //create entity
    taskModel.id = docRef.id; //=
    return docRef.set(taskModel); //=
  }

  static Future<void> createuser(String email, String password,
      Function onSuccess, Function onError,String name,int age) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user?.uid != null) {
        UserModel user = UserModel(
            id: credential.user!.uid, email: email, name: name, age: age);

        addUsertoFirestore(user).then((value){
          onSuccess();
        });

      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> Login(String email, String password, Function onSuccess,
      Function onError) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user?.uid != null) {
        
        var user=await readUserFromFirestore(credential.user!.uid);
        onSuccess(user);
      }
    } on FirebaseAuthException catch (e) {
      onError("Wrong mail or password");
    }
  }

  static Future<void> addUsertoFirestore(UserModel userModel) {
    var collection = getUserCollection();
    var docRef = collection.doc(userModel.id);
    return docRef.set(userModel);
    // create table
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }
 static Future<UserModel?> readUserFromFirestore(String id)
  async{
    DocumentSnapshot<UserModel> doc=await
    getUserCollection().doc(id).get();
    return doc.data();

  }

}
