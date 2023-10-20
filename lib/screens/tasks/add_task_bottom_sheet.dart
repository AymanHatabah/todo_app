import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/shared/firebase/firebase_function.dart';
import 'package:todo/styles/colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var tittlecontroller = TextEditingController();

  var descriptioncontroller = TextEditingController();

  var selecteddate = DateTime.now();
  var formky = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        key: formky,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add new Task",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: tittlecontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter task title";
                }
                return null;
              },
              decoration: InputDecoration(
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("enter your task"),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primarycolor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primarycolor)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: descriptioncontroller,
              validator: (value) {
                if (value== null || value.isEmpty) {
                  return "please enter task title";
                }
                return null;
              },
              decoration: InputDecoration(
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Task description"),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primarycolor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primarycolor)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Select Date",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  SelectDate(context);
                },
                child: Text(
                  selecteddate.toString().substring(0, 10),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                  onPressed: () {
                    if(formky.currentState!.validate()){
                      TaskModel taskModel = TaskModel(
                          title: tittlecontroller.text,
                          Description: descriptioncontroller.text,
                          date:DateUtils.dateOnly(selecteddate).millisecondsSinceEpoch);

                      FirebaseFunction.addTask(taskModel).then((value) {
                        Navigator.pop(context);
                      });

                    }

                  },
                  child: Text("Add Task")
              ),
            )
          ],
        ),
      ),
    );
  }

  SelectDate(BuildContext context) async {
    DateTime? chosendate = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                primary: primarycolor,
                onPrimary: Colors.white54,
                onSurface: Colors.black45,
              )),
              child: child!);
        },
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosendate == null) {
      return;
    }
    selecteddate = chosendate;
    setState(() {});
  }
}
