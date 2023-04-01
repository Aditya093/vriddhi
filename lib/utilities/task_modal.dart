import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vriddhi_0/constants.dart';
class TaskModal extends StatefulWidget {
  // const TaskModal({super.key});
  TaskModal({required this.taskNumber,required this.duration, required this.taskTitle, required this.description, required this.resources ,required this.dependancies,@required this.onTapofDone });
  final String taskTitle;
  final String description;
  final String duration;
  final String resources;
  final String dependancies;
  final VoidCallback? onTapofDone;
  final int taskNumber;

  @override
  State<TaskModal> createState() => _TaskModalState();
}

class _TaskModalState extends State<TaskModal> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child:Container(
          padding: EdgeInsets.only(left: 20.0, right:20.0, bottom: 20.0),
          decoration: BoxDecoration(
            color: Color(0xFFF8F8F6),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: [
              Icon(FontAwesomeIcons.minus, size: 30.0,),
              Text(
                'Task ${widget.taskNumber}',
                style: kFormPrimaryHeadingStyle,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Task : ", style:kFormTextFieldLabelStyle.copyWith(fontWeight: FontWeight.w600),),
                      Expanded(child: Text(widget.taskTitle, style:kFormTextFieldLabelStyle)),
                    ],
                  ),
                  SizedBox(height:8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Description :  ", style:kFormTextFieldLabelStyle.copyWith(fontWeight: FontWeight.w600),),
                      Text(widget.description, style:kFormTextFieldLabelStyle),
                    ],
                  ),
                  SizedBox(height:8.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Duration : ", style:kFormTextFieldLabelStyle.copyWith(fontWeight: FontWeight.w600),),
                      Expanded(child: Text(widget.duration, style:kFormTextFieldLabelStyle)),
                    ],
                  ),
                  SizedBox(height: 8.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Resources :  ", style:kFormTextFieldLabelStyle.copyWith(fontWeight: FontWeight.w600),),
                      Text(
                          widget.resources,
                          style:kFormTextFieldLabelStyle),
                    ],
                  ),
                  SizedBox(height: 8.0,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dependancies : ", style:kFormTextFieldLabelStyle.copyWith(fontWeight: FontWeight.w600),),
                      Expanded(child: Text(widget.dependancies == "" ? "None" : widget.dependancies, style:kFormTextFieldLabelStyle)),
                    ],
                  ),
                  SizedBox(height: 8.0,),

                  Center(
                    child: ElevatedButton(
                      onPressed: widget.onTapofDone,
                      child: Text('Done'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          fontFamily: "Catamaran",
                        ),
                        backgroundColor: kButtonPositiveColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
      ),
    );
  }
}