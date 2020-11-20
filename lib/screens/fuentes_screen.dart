import 'package:flutter/material.dart';

class FuentesScreen extends StatelessWidget {
  String etapa;

  @override
  Widget build(BuildContext context) {
    etapa = "ZZZZZ";
    return Scaffold(
      appBar: AppBar(title: Text(etapa)),
      body: Text("Esto deberían ser un ListView"),
    );
  }
}
