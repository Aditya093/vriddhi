import 'package:flutter/material.dart';
import 'package:vriddhi_0/screens/home_screen.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:vriddhi_0/widgets/big_appbar.dart';

class StackedAppAndBox extends StatelessWidget {
  final Widget boxCardContent;
  const StackedAppAndBox({
    required this.boxCardContent
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //App Bar Container
        BigAppBar(),
        //Weather Container
        BoxCard(cardChild: boxCardContent,),
      ],
    );
  }
}