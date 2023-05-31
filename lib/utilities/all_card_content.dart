import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/global_listeners/temperature_data.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:vriddhi_0/global_listeners/user_data.dart';

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
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy, EEEE').format(now);
    final userData = Provider.of<UserData>(context);
    final temperatureData = Provider.of<WeatherDataAll>(context);
    return Container(
      padding: EdgeInsets.only(top: 25, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Weather Text1
          Text(
            'Hey, ${userData.username}',
            style: TextStyle(
              fontSize: 30,
              color: kNavyBlueColor,
            ),
          ),
          //Weather text2
          SizedBox(height:5.0),
          Text(
            formattedDate,
            style: TextStyle(
              fontSize: 15,
              color: kNavyBlueColor,
            ),
          ),
          //Row - Temp-Text + image
          Expanded(
            child: Row(
              children: [
                //Temp- text
                Text(
                  '${temperatureData.temperature}°C',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: kNavyBlueColor,
                      fontSize: 50,
                  ),
                ),
                //Weather-Image
                Spacer(),
                Image.asset('assets/images/weather/Weather_SnowStorm.png', height: 400.0,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Progress Content - box card
class CardContentProgressBox extends StatelessWidget {
  CardContentProgressBox({required this.levelImage, required this.currentLevel});
  final String levelImage;
  final int currentLevel;
  // late List<String> words = levelImage.toTitleCase().split(" ");
  // final String levelName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //ProgressTextBar
        Container(
          decoration: BoxDecoration(
            color: kLightTealCardColor,
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
            'assets/images/scenes_farming/${levelImage}.png',
            // height: 300,
            // width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),

        //Row of Icon + Week + Divider + Task Name + Statusof Task
        Container(
          decoration: BoxDecoration(
            // color: kSecondaryBgColor,
            color: kLightTealCardColor,
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
                'Level $currentLevel',
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
                '${(levelImage.substring(6,))}',
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

//Disease Cards content
class DiseaseListTile extends StatelessWidget {
  DiseaseListTile({required this.scientific_name, required this.imagePath, required this.title,required this.id,});

  final String imagePath;
  final String title;
  final int id;
  final String scientific_name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(child: Image.asset(imagePath,height: 45,width: 45,), borderRadius: BorderRadius.circular(10.0),),
      title: Text(title, style: kFormTextFieldLabelStyle.copyWith(fontSize: 16.0),),
      subtitle: Text(scientific_name, style:kFormSecondaryHeadingStyle),
      trailing: Icon(Icons.navigate_next),
      hoverColor: Colors.transparent,
    );
  }
}

