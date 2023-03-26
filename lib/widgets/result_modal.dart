import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vriddhi_0/constants.dart';

class ResultModal extends StatefulWidget {
  const ResultModal({super.key});

  @override
  State<ResultModal> createState() => _ResultModalState();
}

class _ResultModalState extends State<ResultModal> {

  bool isSelected = false;

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Crop Recommendations',
                    style: kFormPrimaryHeadingStyle,
                  ),
                  Text(
                    'This are based on your preferences',
                    style: kFormSecondaryHeadingStyle,
                  ),
                  GestureDetector(
                    onTap: _toggleSelection,
                    child: Card(
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:10.0),
                                child: Image(
                                  image: AssetImage('assets/images/temp/Trending_Icon.png'),
                                  width:20.0,
                                  height:20.0,
                                ),
                              ),
                              Text(
                                'Wheat',
                                style: kFormTextFieldLabelStyle.copyWith(
                                  fontSize:25.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              IconButton(
                                icon: isSelected
                                    ? Icon(Icons.check_circle_outline)
                                    : Icon(Icons.radio_button_unchecked, color: Colors.white,),
                                onPressed: _toggleSelection,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child:Image.asset('assets/images/crops/Crop_Banana.png'),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '86%',
                                            style: kFormTextFieldLabelStyle.copyWith(
                                              fontSize:50.0,
                                            ),
                                          ),
                                          SizedBox(width:10.0),
                                          Flexible(
                                            child: Text(
                                              'Success Rate',
                                              style: kFormTextFieldLabelStyle.copyWith(fontSize:13.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Text(
                                      //   "Previous Year's Stats",
                                      //   style: kFormTextFieldLabelStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 15.0),
                                      // ),
                                      // Text(
                                      //   "1975 Rs/Q",
                                      //   style:kFormTextFieldLabelStyle.copyWith(fontSize: 15.0),
                                      // ),
                                      // Text(
                                      //   "75.8 million MT",
                                      //   style:kFormTextFieldLabelStyle.copyWith(fontSize: 15.0),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height:5.0),
                  if (isSelected)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height:36.0,
                          width:98.0,
                          child: ElevatedButton(
                            onPressed: (){},
                            child: Text('Know More', style: TextStyle(color: kButtonPositiveColor),),
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(
                                fontFamily: "Catamaran",
                              ),
                              backgroundColor: kButtonNegativeColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height:36.0,
                          width:98.0,
                          child: ElevatedButton(
                            onPressed: (){} ,
                            child: Text('Next'),
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(
                                fontFamily: "Catamaran",
                              ),
                              backgroundColor: kButtonPositiveColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          )
      ),
    );
  }
}