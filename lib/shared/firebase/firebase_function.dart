import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/task_model.dart';

class FirebaseFunction {
  //CollectionReference<TaskModel> as return type of withConverter
static CollectionReference<TaskModel> getTaskCollection() {

 return FirebaseFirestore.instance.collection("Tasks").withConverter<TaskModel>(
    fromFirestore: (snapshot, options) {
      return TaskModel.fromJson(snapshot.data()!);
    },
    toFirestore: (value, options) {
      return value.toJson();
    },
  );
}

  static void addTask(TaskModel taskModel){
  var collection=getTaskCollection();// create table
  var docRef=collection.doc(); //create entity
    taskModel.id=docRef.id;//=
    docRef.set(taskModel);//=
  }

}
