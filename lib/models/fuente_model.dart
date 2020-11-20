// To parse this JSON data, do
//
//     final fuente = fuenteFromJson(jsonString);

import 'dart:convert';

Fuente fuenteFromJson(String str) => Fuente.fromJson(json.decode(str));

String fuenteToJson(Fuente data) => json.encode(data.toJson());

class Fuente {
  Fuente({
    this.camino,
    this.etapa,
    this.municipio,
    this.coordX,
    this.coordY,
  });

  String camino;
  String etapa;
  String municipio;
  String coordX;
  String coordY;

  factory Fuente.fromJson(Map<String, dynamic> json) => Fuente(
        camino: json["CAMINO"],
        etapa: json["ETAPA"],
        municipio: json["MUNICIPIO"],
        coordX: json["COORD_X"],
        coordY: json["COORD_Y"],
      );

  Map<String, dynamic> toJson() => {
        "CAMINO": camino,
        "ETAPA": etapa,
        "MUNICIPIO": municipio,
        "COORD_X": coordX,
        "COORD_Y": coordY,
      };
}
