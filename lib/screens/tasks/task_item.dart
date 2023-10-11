import 'package:flutter/material.dart';
import 'package:todo/styles/colors.dart';

class TaskItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 14),
      child: Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color:Colors.white ),
        borderRadius: BorderRadius.circular(12)

      ),

child: Padding(
  padding: const EdgeInsets.all(14.0),
  child:   Row(

          children: [

            Container(

              height: 80,

              width: 3,

              decoration: BoxDecoration(

                color: primarycolor,

                borderRadius: BorderRadius.circular(18)





              ),

            ),

            SizedBox(

              width: 20,

            ),

            Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text("Task Title"),

                Text("Task Description"),

              ],

            ),

            Spacer(),

            IconButton(onPressed: () {



            }, icon: Icon(Icons.done))



          ],

        ),
),
      ),
    );
  }
}
