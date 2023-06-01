import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseTaskDateData {
  static final uid = FirebaseAuth.instance.currentUser?.uid;
  static Future<void> setCropDates(String cropName, {String? startDate, String? endDate}) async {

    if (uid != null) {
      final userDocRef = FirebaseFirestore.instance.collection('users').doc(uid);
      final cropDocRef = userDocRef.collection('crops').doc(cropName);

      final dataToUpdate = {
        'crop_name': cropName,
        if (startDate != null) 'start_date': startDate,
        if (endDate != null) 'end_date': endDate,
        if (endDate == null) 'end_date': 'Ongoing',
      };

      await cropDocRef.set(dataToUpdate, SetOptions(merge: true));
    }
  }


  static Future<Map<String, String>> getCropDates(String cropName) async {

    final cropDates = {'start_date': '', 'end_date': ''};

    if (uid != null) {
      final userDocRef = FirebaseFirestore.instance.collection('users').doc(uid);
      final cropDocRef = userDocRef.collection('crops').doc(cropName);

      final cropSnapshot = await cropDocRef.get();

      if (cropSnapshot.exists) {
        final cropData = cropSnapshot.data() as Map<String, dynamic>;
        cropDates['start_date'] = cropData['start_date'].toString() ?? '';
        cropDates['end_date'] = cropData['end_date'].toString() ?? '';
      }
    }

    return cropDates;
  }

  static Future<Map<String, String>> getListOfTaskDates() async {
    // final uid = FirebaseAuth.instance.currentUser?.uid;
    final taskDates = <String, String>{};

    if (uid != null) {
      final userDocRef = FirebaseFirestore.instance.collection('users').doc(uid);
      final cropsCollectionRef = userDocRef.collection('crops');
      final cropQuerySnapshot = await cropsCollectionRef.get();

      for (final cropDocSnapshot in cropQuerySnapshot.docs) {
        final cropData = cropDocSnapshot.data();
        final cropName = cropData['cropName'] as String?;
        final startDate = cropData['start_date'] as String?;
        final endDate = cropData['end_date'] as String?;

        if (cropName != null) {
          final taskDate = _formatTaskDate(startDate, endDate);
          if (taskDate != null) {
            taskDates[cropName] = taskDate;
          }
        }
      }
    }

    return taskDates;
  }

  static String? _formatTaskDate(String? startDate, String? endDate) {
    if (startDate != null && endDate != null) {
      return '$startDate - $endDate';
    } else if (startDate != null) {
      return startDate;
    } else if (endDate != null) {
      return endDate;
    }

    return null;
  }

}
