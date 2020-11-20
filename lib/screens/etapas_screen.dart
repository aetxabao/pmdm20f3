import 'package:flutter/material.dart';
import 'package:fuentes/providers/fuentes_provider.dart';
import 'package:fuentes/screens/fuentes_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EtapasScreen extends StatelessWidget {
  String camino;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    camino = box.read("camino");
    return Scaffold(
      appBar: AppBar(title: Text('Camino $camino')),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: fuentesProvider.cargarEtapas(camino),
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

  List<Widget> _listaElementos(BuildContext context, List<String> data) {
    final List<Widget> lst = [];
    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          box.write("etapa", element);
          Get.to(FuentesScreen());
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
