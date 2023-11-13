import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_core.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = Get.put<HomeCore>(HomeCore());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: "CSV Firestore".text.white.make(),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // model.uploadCSV();
            },
            child: "Upload CSV".text.make(),
          ),
          ElevatedButton(
            onPressed: () {
              model.downloadCSV();
            },
            child: "Download CSV".text.make(),
          ),
        ],
      ),
    );
  }
}
