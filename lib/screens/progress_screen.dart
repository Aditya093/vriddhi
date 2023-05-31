import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/utilities/all_card_content.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:vriddhi_0/utilities/task_modal.dart';
import 'package:vriddhi_0/widgets/stacked_app_and_box.dart';
import 'package:change_case/change_case.dart';

class ProgressScreen extends StatefulWidget {
  // static const String id = 'progress_screen';

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  //variables
  String selectedCrop = 'Maize';
  Map<dynamic, dynamic> allJsonData = {};
  List<bool> taskStatus = [];
  List<String> cropsNameList = ['Apple', 'Banana', 'Wheat'];
  int current_level = 1;
  List _tasks = [];
  bool isLoading = true;
  bool isDoneAllTasks = false;
  // bool isCurrentLevelCardVisible = true;
  double levelCompletion = 0;
  int totalLevelsDone = 0;
  int numberOfTotalLevels = 0;
  int totalTasksLeft = 0;
  //methods
  void initState() {
    super.initState();
    getLevelsAndTask();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/task.json');
    final data = await jsonDecode(response);
    setState(() {
      allJsonData = data;
    });
  }

  Future<void> getLevelsAndTask() async {
    await readJson();
    setState(() {
      final levelData = allJsonData[selectedCrop.toCapitalCase()] as Map;
      int totalLevels = levelData.length - 2;
      setState(() {
        this.numberOfTotalLevels = totalLevels;
      });

      getTasks();
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<void> getTasks() async {
    _tasks =
    await allJsonData[selectedCrop.toCapitalCase()]["level $current_level"];
    // await getInitialTasksStatus();
    for (int i = 0; i <= _tasks.length - 1; i++) {
      taskStatus.add(false);
    }
    setState(() {
      totalTasksLeft = _tasks.length - 1;
    });
  }

  void markTaskCompleted(int index) {
    setState(() {
      taskStatus[index] = true;
    });
  }

  // void updateTaskList(String crop) {
  //   setState(() {
  //     selectedCrop = crop;
  //     // selectedCropTasks = tasks[selectedCrop];
  //   });
  // }

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: (selectedCrop != '' && isLoading == false)
            ? SingleChildScrollView(
          physics: ScrollPhysics(),
          primary: true,
          child: Column(
            children: [
              //Stackedd App Bar with progress box
              StackedAppAndBox(
                boxCardContent: CardContentProgressBox(
                    levelImage: _tasks[0]["change_level"],
                    currentLevel: current_level),
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: LinearProgressIndicator(
                    value: levelCompletion,
                    backgroundColor: kGreyColor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        kPrimaryAppbarColor),
                    minHeight: 10,
                    // semanticsLabel: "Level 3",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Crop : ${selectedCrop.toCapitalCase()}",
                  style: kTitleOfInfoCardsTS,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DynamicDropdownLevelCards(
                // isDone: isDoneAllTasks,
                title: 'Level ${current_level}',
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
                                          totalTasksLeft--;
                                          markTaskCompleted(index);
                                          if (totalTasksLeft == 0) {
                                            print("doneeee");
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'Level $current_level Completed'),
                                                  duration:
                                                  Duration(seconds: 2),
                                                ),
                                            );
                                            // Dialogs.materialDialog(
                                            //     color: Colors.white,
                                            //     msg: 'Congratulations, you won 500 points',
                                            //     title: 'Congratulations',
                                            //     lottieBuilder: Lottie.asset(
                                            //       'assets/cong_example.json',
                                            //       fit: BoxFit.contain,
                                            //     ),
                                            //     customView: MySuperWidget(),
                                            //     customViewPosition: CustomViewPosition.BEFORE_ACTION,
                                            //     context: context,
                                            //     actions: [
                                            //       IconsButton(
                                            //         onPressed: () {},
                                            //         text: 'Claim',
                                            //         iconData: Icons.done,
                                            //         color: Colors.blue,
                                            //         textStyle: TextStyle(color: Colors.white),
                                            //         iconColor: Colors.white,
                                            //       ),
                                            //     ]),

                                            isDoneAllTasks = true;
                                            current_level += 1;
                                            totalLevelsDone++;
                                            levelCompletion = 1 -
                                                (numberOfTotalLevels -
                                                    totalLevelsDone) /
                                                    numberOfTotalLevels;
                                            taskStatus.clear();
                                            getTasks();

                                            // print("helloe sone");
                                            // isLoading == true;
                                          }
                                          Navigator.pop(context);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                          );
                        },
                        child: IgnorePointer(
                          ignoring: taskStatus[index],
                          child: Opacity(
                            opacity: !taskStatus[index] ? 1 : 0.5,
                            child: Card(
                              color: kCardColorSecond,
                              margin: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 10),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: ListTile(
                                  title: Text(
                                    title,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: kNavyBlueColor,
                                        height: 1),
                                  ),
                                  subtitle: Text(
                                    duration,
                                    style: const TextStyle(
                                        color:
                                        kDescriptionFontColor),
                                  ),
                                  trailing: taskStatus[index]
                                      ? Icon(
                                    Icons.check_circle,
                                    color: kPrimaryAppColor,
                                  )
                                      : Icon(
                                      Icons.arrow_forward_ios,
                                      color: kNavyBlueColor,
                                      size: 18),
                                ),
                              ),
                            ),
                          ),
                        ),);
                  },
                )
                    : Container(
                  child: Text("No Tasks Left"),
                ),
              ),
            ],
          ),
        )
            : SpinKitDoubleBounce(
          color: kPrimaryAppColor,
          size: 100,
        ),
      ),
    );
  }
}
