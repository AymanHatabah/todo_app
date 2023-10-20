import 'package:flutter/material.dart';
import 'package:todo/models/user_model.dart';
import 'package:todo/screens/settings/settings_tab.dart';
import 'package:todo/screens/tasks/tasks_tab.dart';

import '../screens/tasks/add_task_bottom_sheet.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "Layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;
  List<Widget> tabs = [TasksTab(), SettingTab()];

  @override
  Widget build(BuildContext context) {
   var user=ModalRoute.of(context)?.settings.arguments as UserModel;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("To Do ${user.name} "),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShowSheet();
        },
        child: Icon(Icons.add),
        shape: CircleBorder(side: BorderSide(color: Colors.white, width: 5)),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        notchMargin: 8,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                label: "")
          ],
        ),
      ),
      body: tabs[index],
    );
  }
  void ShowSheet(){
      showModalBottomSheet(

        context: context,
isScrollControlled: true,
        builder:(context) {


        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom
          ),
          child: AddTaskBottomSheet(),
        );
      },);

  }
}

