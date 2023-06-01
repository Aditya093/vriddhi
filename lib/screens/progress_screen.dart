import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/data_lists/allDataList.dart';
import 'package:vriddhi_0/firebase_custom_variables/task_date_data.dart';
import 'package:vriddhi_0/global_listeners/selected_crop.dart';
import 'package:vriddhi_0/services/get_current_date.dart';
import 'package:vriddhi_0/services/read_json.dart';
import 'package:vriddhi_0/utilities/all_card_content.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:vriddhi_0/utilities/task_modal.dart';
import 'package:vriddhi_0/widgets/stacked_app_and_box.dart';
import 'package:change_case/change_case.dart';

class ProgressScreen extends StatefulWidget {
  static const String id = 'progress_screen';

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  //variables
  String selectedCrop = '';
  Map<dynamic, dynamic> allJsonData = {};
  List<bool> taskStatus = [];
  List<String> cropsNameList = AllDataList.cropsNameList;
  int current_level = 1;
  List _tasks = [];
  bool isLoading = true;
  bool isDoneAllTasks = false;
  double levelCompletion = 0;
  int totalLevelsDone = 0;
  int numberOfTotalLevels = 0;
  int totalTasksLeft = 0;

  //methods
  Future<void> getLevelsAndTask() async {
    allJsonData = await ReadJson.readJson('assets/task.json');
    final levelData = allJsonData[selectedCrop.toCapitalCase()] as Map;
    int totalLevels = levelData.length - 2;
    setState(() {
      this.numberOfTotalLevels = totalLevels;
    });
    getTasks();
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
      isLoading = false;
    });
  }

  void markTaskCompleted(int index) {
    setState(() {
      taskStatus[index] = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLevelsAndTask();
  }
  void updateSelectedCrop(String crop) {
    final currentCrop = Provider.of<SelectedCrop>(context, listen: false);
    currentCrop.setCurrentCrop(crop ?? '');
    setState(() {
      selectedCrop = currentCrop.selectedCrop;
      getLevelsAndTask();
      // selectedCropTasks = tasks[selectedCrop];
    });
  }


  @override
  Widget build(BuildContext context) {
    //Provider Accessing
    final selectedCropData = Provider.of<SelectedCrop>(context);
    selectedCrop = selectedCropData.selectedCrop;
    return SafeArea(
      child: Scaffold(
        body: (isLoading == false && selectedCrop != '')
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
                        style: kTitleOfInfoCardsTS,
                      ),
                    ),
                    // Display the progress bar using a LinearProgressIndicator
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: Column(
                        children: [
                          Align(
                              alignment:Alignment.lerp(Alignment.topLeft, Alignment.topRight, levelCompletion) as AlignmentGeometry,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Level $current_level',
                                    textAlign: TextAlign.center,
                                    style: kProgressBoxbottomTS,
                                  ),
                                  // FaIcon(FontAwesomeIcons.locationPin,color: kPrimaryAppColor,),
                                ],
                              )),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: LinearProgressIndicator(
                              value: levelCompletion,
                              backgroundColor: kGreyColor,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  kPrimaryAppbarColor),
                              minHeight: 10,
                            ),
                          ),
                        ],
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
                                                setState(() {
                                                  totalTasksLeft--;
                                                  markTaskCompleted(index);
                                                  if (totalTasksLeft == 0) {
                                                    totalLevelsDone++;
                                                    if(totalLevelsDone == numberOfTotalLevels){
                                                      //All Levels Are Completed
                                                      //do something
                                                      String current_date = CurrentDate.getCurrentDate();
                                                      FirebaseTaskDateData.setCropDates(selectedCrop,endDate: current_date);
                                                      setState(()  {
                                                        updateSelectedCrop('');
                                                      });
                                                    }
                                                      isDoneAllTasks = true;
                                                      current_level += 1;
                                                      levelCompletion = 1 -
                                                          (numberOfTotalLevels -
                                                              totalLevelsDone) /
                                                              numberOfTotalLevels;
                                                      taskStatus.clear();
                                                      getTasks();


                                                  }
                                                  Navigator.pop(context);
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: TaskCard(taskStatus: taskStatus, title: title, duration: duration,cardIndex: index,));
                              },
                            )
                          : Container(
                              child: Text("No Tasks Left"),
                            ),
                    ),
                  ],
                ),
              )
            : (selectedCrop == '' ? Column(
          children: [
            //Stackedd App Bar with progress box
            StackedAppAndBox(
              boxCardContent: CardContentProgressBox(
                  levelImage: 'Scene_Start',
                  currentLevel: 0),
            ),
            SizedBox(
              height: 20,
            ),
            //Select Crop
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Select Crop:',
                style: kFormPrimaryHeadingStyle,
              ),
            ),
            //DropDownButton
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: kLightTealCardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButton<String>(
                hint: Text('Please select a crop'),
                value:  'Apple',
                itemHeight: 70,
                focusColor: kPrimaryAppColor,
                dropdownColor: kLightTealCardColor,
                menuMaxHeight: 500,
                borderRadius: BorderRadius.circular(15),
                style: kProgressBoxTitleTS,
                onChanged: (String? newValue)  {
                  setState(()  {
                    updateSelectedCrop(newValue ?? '');
                  });
                },
                items: cropsNameList.map<DropdownMenuItem<String>>((String crop) {
                  return DropdownMenuItem<String>(
                    value: crop,
                    child: Text(crop),
                  );
                }).toList(),
              ),
            ),
          ],
        ) : kLoader),
      ),
    );
  }
}


