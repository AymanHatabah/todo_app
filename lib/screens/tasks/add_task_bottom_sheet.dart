

import 'package:flutter/material.dart';
import 'package:todo/styles/colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var tittlecontroller = TextEditingController();

  var descriptioncontroller = TextEditingController();

  var selecteddate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Add new Task", textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),

          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: tittlecontroller,
            decoration: InputDecoration(
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("enter your task"),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: primarycolor
                  )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: primarycolor
                  )
              ),
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            controller: descriptioncontroller,
            decoration: InputDecoration(
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Task description"),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: primarycolor
                  )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: primarycolor
                  )
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text("Select Date",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          SizedBox(height: 10,),
          InkWell(
              onTap: () {
                SelectDate(context);
              },
              child: Text(selecteddate.toString().substring(0,10), textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),)),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(onPressed: () {

            }, child: Text("Add Task")),
          )
        ],
      ),
    );
  }

  SelectDate(BuildContext context)async {
 DateTime? chosendate=  await showDatePicker(context: context,
        builder: (context, child) {
          return Theme(data:Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primarycolor,
              onPrimary: Colors.white54,
              onSurface: Colors.black45,


            )
          ) , child: child!);
        },
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate:DateTime.now().add(Duration(days: 365)));
if(chosendate==null){
  return;
}
selecteddate=chosendate;
setState(() {

});
  }
}