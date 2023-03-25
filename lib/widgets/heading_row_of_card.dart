import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';

class HeadingRowOfRectCards extends StatelessWidget {
  final String heading;
  final VoidCallback onTapViewAll;
  HeadingRowOfRectCards({required
  this. heading, required this.onTapViewAll});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          //Explore Text
          Text(
            heading,
            style: kTitleOfInfoCardsTS,
          ),
          //Text Button - View All
          Spacer(),
          TextButton(
            onPressed: onTapViewAll,
            child: Text(
              'View All',
              style: TextStyle(fontSize: 15, color: kNavyBlueColor),
            ),
          ),
        ],
      ),
    );
  }
}