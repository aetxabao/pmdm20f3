import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fuentes/models/fuente_model.dart';
import 'package:get/get.dart';
import 'package:latlong/latlong.dart';
import 'package:utm/utm.dart';

class MapaScreen extends StatefulWidget {
  @override
  _MapaScreenState createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  Fuente fuente;
  LatLng latLng;

  @override
  Widget build(BuildContext context) {
    fuente = Get.arguments;
    final latlon = UTM.fromUtm(
      easting: double.parse(fuente.coordX),
      northing: double.parse(fuente.coordY),
      zoneNumber: 30,
      zoneLetter: "N",
    );
    latLng = new LatLng(latlon.lat, latlon.lon);
    return Scaffold(
      appBar: AppBar(
        title: Text(fuente.municipio),
      ),
      body: _flutterMap(),
    );
  }

  Widget _flutterMap() {
    return new FlutterMap(
      options: new MapOptions(
        center: latLng,
        zoom: 18.0,
      ),
      layers: [
        _mapa(),
        _markers(),
      ],
    );
  }

  _mapa() {
    return new TileLayerOptions(
      urlTemplate: "https://api.tiles.mapbox.com/v4/"
          "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
      additionalOptions: {
        'accessToken':
            'pk.eyJ1IjoiYWV0eGFiYW8iLCJhIjoiY2toamZsdmF2MHd4ajJzcDZtZDJmczFieCJ9.nIpNzVE34B8aTGo5bahEJg',
        'id': 'mapbox.satellite',
      },
    );
  }

  _markers() {
    return new MarkerLayerOptions(
      markers: [
        new Marker(
          width: 50.0,
          height: 50.0,
          point: latLng,
          builder: (ctx) => new Container(
            child: Icon(Icons.location_on),
          ),
        ),
      ],
    );
  }
}
