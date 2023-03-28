import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  const ReusableCard({this.cardChild, this.onPress});
  final Widget? cardChild;
  final Function? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
        color: Colors.white,
        child: cardChild,
      ),
    );
  }
}
