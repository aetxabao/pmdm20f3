import 'package:flutter/material.dart';

class EtapasScreen extends StatelessWidget {
  String camino;

  @override
  Widget build(BuildContext context) {
    camino = "XXXXX";
    return Scaffold(
      appBar: AppBar(title: Text('Camino $camino')),
      body: Text("Esto deberían ser un ListView"),
    );
  }
}
