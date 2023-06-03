import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/firebase_custom_variables/task_date_data.dart';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';
class PreviousCropsScreen extends StatefulWidget {
  @override
  State<PreviousCropsScreen> createState() => _PreviousCropsScreenState();
}

class _PreviousCropsScreenState extends State<PreviousCropsScreen> {
  Map<String,String> cropWithDatesList = {};
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getCropDatesList();
  }

  Future<void> getCropDatesList() async{
     Map<String,String> cropWithDatesList = await FirebaseTaskDateData.getCropDates('Onion');
     this.cropWithDatesList = cropWithDatesList;
     setState(() {
       isLoading == false;
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.smallAppBar('Crop History'),
      body: (!isLoading) ? Card(
        color: kLightTealCardColor,
        child: ListTile(
          title: Text('Crop: ${cropWithDatesList['start_date']}'),
        ),
      ) : kLoader,
    );
  }
}
