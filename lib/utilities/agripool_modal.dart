import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
class AgriPoolModal extends StatelessWidget {
  const AgriPoolModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Text Add task
              Text(
                'Add Name',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0,
                    color: kPrimaryAppColor,
                    fontWeight: FontWeight.bold),
              ),
              //Text field
              TextField(
                autofocus: false,
                textAlign: TextAlign.center,

              ),
              SizedBox(height: 10.0,),
              //Add button
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(backgroundColor: kButtonPositiveColor ),
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
