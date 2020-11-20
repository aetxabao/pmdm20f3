import 'package:flutter/material.dart';
import 'package:fuentes/screens/etapas_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CaminosScreen extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Caminos de Santiago"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Francés"),
              onPressed: () {
                box.write("camino", "Francés");
                Get.to(EtapasScreen());
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
              child: Text("Aragonés"),
              onPressed: () {
                box.write("camino", "Aragonés");
                Get.to(EtapasScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
