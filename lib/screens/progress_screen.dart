import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/utilities/all_card_content.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:vriddhi_0/utilities/task_modal.dart';
import 'package:vriddhi_0/widgets/stacked_app_and_box.dart';
import 'package:change_case/change_case.dart';


class ProgressScreen extends StatefulWidget {
  ProgressScreen({required this.cropName});
  final String cropName;
  static const String id = 'progress_screen';


  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  //variables

  double levelCompletion = 0;
   int current_level = 1;
  List _tasks = [];
  final List _levels = [];
  bool isLoading = true;
  // final String cropName = widget.cropName;
  bool isDoneAllTasks = false;
  bool isCurrentLevelCardVisible = true;
  int totalLevelsDone = 0;

  //methods
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/task.json');
    final data = await jsonDecode(response) as Map;
    setState(() {
      final levelData = data[widget.cropName.toCapitalCase()] as Map;
      for (final name in levelData.keys) {
        _levels.add(name);
      }

      _tasks = data[widget.cropName.toCapitalCase()]["level $current_level"];
      setState(() {
        isLoading = false;
      });
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
        body: isLoading == false ?
          SingleChildScrollView(
          physics: ScrollPhysics(),
          primary: true,
          child: Column(
            children: [
              //Stackedd App Bar with progress box
              StackedAppAndBox(
                boxCardContent: CardContentProgressBox(levelImage: _tasks[0]["change_level"],currentLevel: current_level),
              ),
              SizedBox(
                height: 20,
              ),
              //Your Progress
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "My Progress",
                  // textAlign: TextAlign.start,
                  style: kTitleOfInfoCardsTS,
                ),
              ),
              // Display the progress bar using a LinearProgressIndicator
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: LinearProgressIndicator(
                    value: levelCompletion,
                    backgroundColor: kGreyColor,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(kPrimaryAppbarColor),
                    minHeight: 10,
                    // semanticsLabel: "Level 3",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Crop : ${widget.cropName.toCapitalCase()}",
                  style: kTitleOfInfoCardsTS,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                  itemCount: _levels.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return DynamicDropdownLevelCards(
                      isDone: this.isDoneAllTasks,
                      title: _levels[index].toString().toCapitalCase(),
                      current_level: current_level,
                      card_level: index + 1,
                      // cardVisibility: isCurrentLevelCardVisible,
                      dropdownChild: (_tasks.length - 1) != 0
                          ? ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: _tasks.length - 1,
                              itemBuilder: (context, index) {
                                index = index + 1;
                                String title = _tasks[index]["task"];
                                String duration = _tasks[index]["duration"];
                                String description =
                                    _tasks[index]["description"];
                                List<dynamic> resourcesList =
                                    _tasks[index]["resources"];
                                String resources = resourcesList.join(', ');
                                List<dynamic>? dependaciesList =
                                    _tasks[index]["dependancies"];
                                String dependancies = dependaciesList != null
                                    ? dependaciesList.join(', ')
                                    : "";
                                return GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) =>
                                            SingleChildScrollView(
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: TaskModal(
                                              taskNumber: index,
                                              taskTitle: title,
                                              duration: duration,
                                              description: description,
                                              resources: resources,
                                              dependancies: dependancies,
                                              onTapofDone: () {
                                                // print("Done");
                                                setState(() {
                                                  _tasks.removeAt(index);
                                                  if(_tasks.length - 1 == 0){
                                                    isDoneAllTasks = true;
                                                    current_level += 1;
                                                    totalLevelsDone++;
                                                    levelCompletion = 1 -  (_levels.length-totalLevelsDone)/_levels.length;
                                                    isLoading == true;
                                                    readJson();
                                                    print("helloe sone");

                                                  }
                                                  Navigator.pop(context);

                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: TaskRectangleCard(
                                        titleText: title,
                                        descriptionText: duration));
                              },
                            )
                          : Container(
                              child: Text("No Tasks Left"),
                      ),
                    );
                  }),
            ],
          ),
        )
        : Center(child: CircularProgressIndicator(color: kNavyBlueColor,backgroundColor: kBackgroundColor,)),
      ),
    );
  }
}
