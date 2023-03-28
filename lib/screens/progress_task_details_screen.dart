import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';

class ProgressTaskDetailsScreen extends StatefulWidget {
  static final String id = 'progress_task_details_screen';
  @override
  State<ProgressTaskDetailsScreen> createState() =>
      _ProgressTaskDetailsScreenState();
}

class _ProgressTaskDetailsScreenState extends State<ProgressTaskDetailsScreen> {
 int _currentWeek = 1;
 List _tasks = [];
 Future<void> readJson() async {
   final String response = await rootBundle.loadString('assets/task.json');
   final data = await jsonDecode(response);
   setState(() {
     _tasks = data["week $_currentWeek"];
     print(_tasks[1]["task"]);
   });
 }
 @override
  void initState() {
    super.initState();
    readJson();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              //Week Title + menu icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  Text(
                    'Week $_currentWeek',
                    style: kWeekTitleTS,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                    ),
                  ),
                ],
              ),
              //Image
              Center(child: Image.asset('assets/images/temp/water_plant_woman.png')),
              //Tasks title
              Padding(
                //why this paddinggg manually??
                padding: const EdgeInsets.only(left: 20),
                child: Text('Tasks', style: kTitleOfWeekCardsTS,),
              ),

              //Task cards
              _tasks.isNotEmpty
                  ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      String title = _tasks[index]["task"];
                      String duration = _tasks[index]["duration"];
                      return TaskRectangleCard(titleText: title, descriptionText: duration);
                    },
                  ) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

