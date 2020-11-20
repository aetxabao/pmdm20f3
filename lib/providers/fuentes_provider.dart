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
    lstEtapas = [];
    // Código incompleto a implementar
    await new Future.delayed(const Duration(seconds: 1));
    return lstEtapas;
  }

  Future<List<Fuente>> cargarFuentesFiltradas(String etapa) async {
    lstFuentesFiltradas = [];
    // Código incompleto a implementar
    await new Future.delayed(const Duration(seconds: 1));
    return lstFuentesFiltradas;
  }
}

final fuentesProvider = new FuentesProvider();
