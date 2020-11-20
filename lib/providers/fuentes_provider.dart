import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:fuentes/models/fuente_model.dart';
import 'package:fuentes/models/fuentes_model.dart';

class FuentesProvider {
  String camino;
  String etapa;
  List<Fuente> lstFuentes = [];
  List<String> lstEtapas = [];
  List<Fuente> lstFuentesFiltradas = [];

  Future<List<Fuente>> cargarFuentes() async {
    final data = await rootBundle.loadString('assets/data/fuentes.json');
    final decodedData = json.decode(data);
    final openData = decodedData['OpenData'];
    final openDataRow = openData['OpenDataRow'];
    Fuentes fuentes = Fuentes.fromJsonList(openDataRow);
    lstFuentes = fuentes.lista;
    return lstFuentes;
  }

  Future<List<String>> cargarEtapas(String camino) async {
    if (this.camino == camino) {
      return lstEtapas;
    } else {
      this.camino = camino;
    }
    if (lstFuentes.length == 0) {
      await cargarFuentes();
    }
    lstEtapas = [];
    lstFuentes.forEach((fuente) {
      if ((fuente.camino == camino) && (lstEtapas.indexOf(fuente.etapa) < 0)) {
        lstEtapas.add(fuente.etapa);
      }
    });
    return lstEtapas;
  }

  Future<List<Fuente>> cargarFuentesFiltradas(String etapa) async {
    if (this.etapa == etapa) {
      return lstFuentesFiltradas;
    } else {
      this.etapa = etapa;
    }
    if (lstFuentes.length == 0) {
      await cargarFuentes();
    }
    lstFuentesFiltradas = [];
    lstFuentes.forEach((fuente) {
      if (fuente.etapa == etapa) {
        lstFuentesFiltradas.add(fuente);
      }
    });
    return lstFuentesFiltradas;
  }
}

final fuentesProvider = new FuentesProvider();
