import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/screens/tasks/task_item.dart';
import 'package:todo/shared/firebase/firebase_function.dart';
import 'package:todo/styles/colors.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date){
            setState(() {
              selectedDate=date;

            });

          },
          leftMargin: 20,
          monthColor: primarycolor,
          dayColor: primarycolor.withOpacity(0.8),
          activeDayColor: Colors.white,
          activeBackgroundDayColor: primarycolor,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: 'en',
        ),
        StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Someting was wrong"),
              );
            }
            List<TaskModel> tasks =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            if(tasks.isEmpty){
              return Text("No Tasks");
            }

           return   Expanded(
             child: ListView.builder(itemBuilder:(context, index) {

                  return TaskItem(task: tasks[index],);
                }, itemCount: tasks.length,),
           );
          },

          stream: FirebaseFunction.GetTask(selectedDate),
        )
      ],
    );
  }
}
