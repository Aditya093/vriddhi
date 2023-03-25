import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';

class ProgressTaskDetailsScreen extends StatefulWidget {
  static final String id = 'progress_task_details_screen';
  @override
  State<ProgressTaskDetailsScreen> createState() =>
      _ProgressTaskDetailsScreenState();
}

class _ProgressTaskDetailsScreenState extends State<ProgressTaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20,bottom: 15),
        child: ListView(
          children: [
            //Week Title + menu icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      'Week 12',
                      style: kWeekTitleTS,
                    ),
                  ),
                ),
                Icon(Icons.more_vert,),
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
            TaskRectangleCard(cardChild: CardConentWeekTasks(relatedImagePath: 'assets/images/temp/watering.png', titleText: 'Water', descriptionText: 'Once in a two days',iconOnRight: Icons.task_alt_rounded,),),
            TaskRectangleCard(cardChild: CardConentWeekTasks(relatedImagePath: 'assets/images/temp/soil_check.png', titleText: 'Soil Check', descriptionText: 'Once in a week',iconOnRight: Icons.keyboard_arrow_right,),),
            TaskRectangleCard(cardChild: CardConentWeekTasks(relatedImagePath: 'assets/images/temp/plant_health.png', titleText: 'Plant Health', descriptionText: 'Once in a two days',iconOnRight: Icons.warning_rounded,),),

          ],
        ),
      ),
    );
  }
}

class CardConentWeekTasks extends StatelessWidget {
  const CardConentWeekTasks({
    required this.relatedImagePath,
    required this.titleText,
    required this.descriptionText,
    @required this.iconOnRight,
  });

  final String relatedImagePath;
  final String titleText;
  final String descriptionText;
  final IconData? iconOnRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          //Feature Icon
          Image.asset(
            relatedImagePath,
            height: 80,
            width: 80,
          ),
          SizedBox(width: 12),
          //Title Text + Descrp Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Text
              Text(
                titleText,
                style: TextStyle(fontSize: 23, color: kNavyBlueColor),
              ),
              // Descrp Text
              Flexible(
                child: Text(
                  descriptionText,
                  style: TextStyle(color: kDescriptionFontColor),
                ),
              ),
            ],
          ),
          Spacer(),
          //Icon
          Align(
            alignment: Alignment.centerRight,
            child:Icon(iconOnRight,),
          ),
        ],
      ),
    );
  }
}
