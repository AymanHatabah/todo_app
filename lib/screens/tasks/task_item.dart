import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/shared/firebase/firebase_function.dart';
import 'package:todo/styles/colors.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;

  TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        child: Slidable(
            startActionPane: ActionPane(
                motion: DrawerMotion(), children:[SlidableAction(onPressed: (context) {
FirebaseFunction.deleteTask(task.id);
            },
              spacing: 5,
              label:"Delete",
              icon: Icons.delete,backgroundColor: Colors.red,),SlidableAction(onPressed: (context) {

            },
              spacing: 5,
              label:"Edit",
              icon: Icons.edit,backgroundColor: Colors.blue,)] ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 3,
                  decoration: BoxDecoration(
                      color: primarycolor,
                      borderRadius: BorderRadius.circular(18)),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${task.title}"),
                    Text("${task.Description}"),
                  ],
                ),
                Spacer(),
task.isDone?
Container(

    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green),
    child: Text("Done !",style: TextStyle(color: Colors.white,fontSize: 20),))

      :          InkWell(
                  onTap: () {
                    task.isDone=true;
                    FirebaseFunction.updateTask(task);
                    

                  },
                  child: Container(

                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue),
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
