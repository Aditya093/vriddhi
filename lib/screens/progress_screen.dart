import 'package:flutter/material.dart';
import 'package:vriddhi_0/utilities/all_card_content.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:vriddhi_0/widgets/heading_row_of_card.dart';
import 'package:vriddhi_0/widgets/stacked_app_and_box.dart';

class ProgressScreen extends StatefulWidget {
  static const String id = 'progress_screen';

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Vridhhi'),
        // ),
        body: Material(
          child: ListView(
            children: [
              //Stackedd App Bar with progress box
              StackedAppAndBox(boxCardContent: CardContentProgressBox(),),
              //Heading row tasks and view all
              Padding(
                padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                child: HeadingRowOfRectCards(heading: 'Tasks', onTapViewAll: (){},),
              ),
              //task cards
              // RectangleCard(),
              // RectangleCard(),
              //Weekly Cards with heading
              Padding(
                padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                child: HeadingRowOfRectCards(heading: 'Week 10', onTapViewAll: (){},),
              ),
              // RectangleCard(),
              Padding(
                padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                child: HeadingRowOfRectCards(heading: 'Week 11',onTapViewAll: (){},),
              ),
              // RectangleCard(),
            ],
          ),
        ),
      ),
    );
  }
}

