import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapaScreen extends StatefulWidget {
  @override
  _MapaScreenState createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  LatLng latLng;

  @override
  Widget build(BuildContext context) {
    //Coordenadas utilizadas para pruebas que hay que reemplazar
    latLng = new LatLng(42.81822365, -1.64403897);
    return Scaffold(
      appBar: AppBar(
        title: Text("AAAAA"),
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
        //Token no valido a reemplazar por uno activo
        'accessToken':
            'pk.eyJ1IjoiYWV0eGFiYW8iLCJhIjoiY2tnNHltbHZyMHBqMzJ5cjI5bXd4YzRkOSJ9.AA2XNQgBS47ru9ZXidYX2g',
        'id': 'mapbox.satellite',
      },
    );
  }

  _markers() {
    return new MarkerLayerOptions(
      markers: [
        //Código que hay que crear
      ],
    );
  }
}
