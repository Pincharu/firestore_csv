import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' as rootBundle;

class HomeCore extends GetxController {
  String csvPath = 'assets/csv/islands.csv';

  uploadCSV() async {
    final csvData = await rootBundle.rootBundle.loadString(csvPath);

    List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvData);
    List<List<dynamic>> data = [];

    data = csvTable;

    for (var i = 0; i < data.length; i++) {
      final path = 'islands/${data[i][0]}';
      final ref = FirebaseFirestore.instance.doc(path);
      await ref.set({
        "id": data[i][0],
        "dhaairaID": data[i][1],
        "atoll_name": data[i][2],
        "island_name": data[i][3],
        "population": int.parse(data[i][4].toString()),
        "updated": 2024,
      });

      print("Uploaded $i / ${data.length}");
    }
  }

  downloadCSV() {}
}

// dhaaira_number,islands,dhaaira,name,party,facebook,twitter,website,education,talents,chairman_of_the_committee,introduction,past_accomplishments,promises,campaign_manager_number,campaign_manager,profile_manager,profile_manager_number
