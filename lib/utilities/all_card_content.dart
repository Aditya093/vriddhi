import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'dart:math';

//crop guide content of square card
class CardContentCropGuide extends StatelessWidget {
  CardContentCropGuide({required this.imagePath, required this.title,required this.id});
  final int id ;
  final String imagePath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          imagePath,
          height: 100,
          width: 100,
        ),
        Text(
          title,
          style: TextStyle(
            color: kNavyBlueColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

//weather content of box card
class CardContentWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Weather Text1
          Text(
            'Welcome, User!',
            style: TextStyle(
              fontSize: 30,
              color: kNavyBlueColor,
            ),
          ),
          //Weather text2
          Text(
            '13-03-2023 Monday',
            style: TextStyle(
              fontSize: 10,
              color: kNavyBlueColor,
            ),
          ),
          //Row - Temp-Text + image
          Expanded(
            child: Row(
              children: [
                //Temp- text
                Text(
                  '30°C',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: kNavyBlueColor,
                      fontSize: 50),
                ),
                //Weather-Image
                Spacer(),
                Image.asset('assets/images/weather/Weather_Sunny.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Progress Content - box card
class CardContentProgressBox extends StatefulWidget {
  @override
  State<CardContentProgressBox> createState() => _CardContentProgressBoxState();
}
class _CardContentProgressBoxState extends State<CardContentProgressBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //ProgressTextBar
        Container(
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: 35,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 8,left: 20),
          child: Text(
            'Progress',
            style: kProgressBoxTitleTS,
          ),
        ),
        //ProgressImageContainer
        Container(
          padding: EdgeInsets.all(0),
          height: 130,
          width: MediaQuery.of(context).size.width,
          // color: Colors.blue,
          child: Image.asset(
            'assets/images/scenes_farming/Scene_Start.png',
            // height: 300,
            // width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        //Row of Icon + Week + Divider + Task Name + Statusof Task
        Container(
          decoration: BoxDecoration(
            // color: kSecondaryBgColor,
            color: kCardColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          height: 35,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              //Icon Pin
              Transform.rotate(
                angle: 45 * pi / 180,
                child: Icon(
                  Icons.push_pin_outlined,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              //Week Number
              Text(
                'Week 12',
                style: kProgressBoxbottomTS,
              ),
              Spacer(),
              //divider
              Center(
                child: Text(
                  '|',
                  style: kProgressBoxbottomTS,
                ),
              ),
              //Task name
              Spacer(),
              Text(
                'Harvesting',
                style: kProgressBoxbottomTS,
              ),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.task_alt),
            ],
          ),
        ),
      ],
    );
  }
}

//Feature Icons Content
