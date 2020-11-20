import 'package:fuentes/models/fuente_model.dart';

class Fuentes {
  List<Fuente> lista = new List();

  Fuentes.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final pnt = Fuente.fromJson(item);
      lista.add(pnt);
    });
  }
}
