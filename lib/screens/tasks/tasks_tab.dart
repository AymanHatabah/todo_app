import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/tasks/task_item.dart';
import 'package:todo/styles/colors.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,

          monthColor: primarycolor,
          dayColor: primarycolor.withOpacity(0.8),
          activeDayColor: Colors.white,
          activeBackgroundDayColor: primarycolor,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: 'en',
        ),
    Expanded(
      child: ListView.builder(itemBuilder: (context, index) {
        return  TaskItem();
      },
      itemCount: 8,),
    )
      ],
    );
  }
}
