import 'package:flutter/material.dart';
import 'package:vriddhi_0/screens/progress_task_details_screen.dart';
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
  final int current_week = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Material(
          child: ListView(
            children: [
              //Stackedd App Bar with progress box
              StackedAppAndBox(
                boxCardContent: CardContentProgressBox(),
              ),
              //Weekly Task Cards
              Padding(
                padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                child: HeadingRowOfRectCards(
                  heading: 'Week $current_week',
                  onTapViewAll: () {
                    Navigator.pushNamed(context, ProgressTaskDetailsScreen.id);
                  },
                ),
              ),
              FewTaskCardsForWeek(title: "Prepare the land for planting",),
              FewTaskCardsForWeek(title: "Apply fertilizer to the soil",),
              FewTaskCardsForWeek(title: "Plant maize seeds",),

              Padding(
                padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                child: HeadingRowOfRectCards(
                  heading: 'Week ${current_week+1}',
                  onTapViewAll: () {},
                ),
              ),
              FewTaskCardsForWeek(title: "Apply weed control",),
              FewTaskCardsForWeek(title: "Check soil moisture levels",),
              FewTaskCardsForWeek(title: 'Monitor the growth of the maize plants', ),
            ],
          ),
        ),
      ),
    );
  }
}

