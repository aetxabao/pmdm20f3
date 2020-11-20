import 'package:flutter/material.dart';
import 'package:fuentes/models/fuente_model.dart';
import 'package:fuentes/providers/fuentes_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'mapa_screen.dart';

class FuentesScreen extends StatelessWidget {
  String etapa;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    etapa = box.read("etapa");
    return Scaffold(
      appBar: AppBar(title: Text(etapa)),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: fuentesProvider.cargarFuentesFiltradas(etapa),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaElementos(context, snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _listaElementos(BuildContext context, List<Fuente> data) {
    final List<Widget> lst = [];
    data.forEach((element) {
      final w = ListTile(
        title: Text(element.municipio),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Get.to(MapaScreen(), arguments: element);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
