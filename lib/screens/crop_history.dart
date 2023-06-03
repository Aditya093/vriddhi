import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/utilities/all_card_content.dart';
import 'package:flutter/material.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';

class CropHistory extends StatelessWidget{

  const CropHistory({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: ReusableWidgets.smallAppBar("Previous Crops"),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const[
                Padding(padding: EdgeInsets.only(top:8.0)),
                SizedBox(width:16),
                HistoryCard()
            ],
          )
        ),
      ),
    );
  }


}