import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
     Map<String,String> cropWithDatesList = await FirebaseTaskDateData.getListOfTaskDates();
     this.cropWithDatesList = cropWithDatesList;
     setState(() {
       isLoading = false;
     });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? getCropsStream() {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if(uid != null){
      final userDocRef = FirebaseFirestore.instance.collection('users').doc(uid);
      final cropsCollectionRef = userDocRef.collection('crops');
      print(uid);
      return cropsCollectionRef.snapshots();
    }
    else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.smallAppBar('Crop History'),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: getCropsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No crops found.'));
          }

          final crops = snapshot.data!.docs;
          return ListView.builder(
            itemCount: crops.length,
            itemBuilder: (context, index) {
              final cropData = crops[index].data();
              final startDate = cropData['start_date'] as String ;
              final endDate = cropData['end_date'] as String;
              // Convert startDate and endDate to desired format if needed

              return Card(
                child: ListTile(
                  title: Text('Crop ${index + 1}'),
                  subtitle: Text('Start Date: $startDate\nEnd Date: $endDate'),
                  // Add other card content as needed
                ),
              );
            },
          );
        },
      ),


    );
  }
}
