import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class ZonesPage extends StatefulWidget {
  @override
  _ZonesPageState createState() => _ZonesPageState();
}

class _ZonesPageState extends State<ZonesPage> {
  @override
  Widget build(BuildContext context) {
    return MapboxMap(
      accessToken:
      'pk.eyJ1IjoiYWFya2lwIiwiYSI6ImNrbzh0b2l0eDBiajAycnFtZ2xwdTdhZGwifQ.BL8ZtdHeXXRAMlas2zPxSQ',
      initialCameraPosition: const CameraPosition(
        target: LatLng(-0.36447231406911507, 35.272096629677485),
        zoom: 9,
      ),
    );
  }
}
