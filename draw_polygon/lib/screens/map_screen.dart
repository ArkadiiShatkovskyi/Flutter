import 'dart:collection';
import 'package:draw_polygon/models/polygon_data.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late List<LatLng> polygon1;
  late List<LatLng> polygon2;

  // Maps
  Set<Polygon> _polygons = HashSet<Polygon>();
  late List<LatLng> polygonLatLngs = [];
  late double radius;

  @override
  void initState() {
    super.initState();
    _getPolygons();
  }

  void _getPolygons() async {
    List<List<LatLng>> list = await parsePolygon();
    setState(() {
      polygon1 = list[0];
      polygon2 = list[1];

      _setPolygons(polygon1, polygon2);
    });
  }

  void _setPolygons(List<LatLng> polygon1, List<LatLng> polygon2) {
    const String polygonIdVal = 'polygon_id_1';
    const String polygonIdVal2 = 'polygon_id_2';
    _polygons.add(
      Polygon(
        polygonId: const PolygonId(polygonIdVal),
        points: polygon1,
        strokeWidth: 2,
        strokeColor: Colors.yellow,
        fillColor: Colors.yellow.withOpacity(0.15),
      ),
    );
    _polygons.add(
      Polygon(
        polygonId: const PolygonId(polygonIdVal2),
        points: polygon2,
        strokeWidth: 2,
        strokeColor: Colors.yellow,
        fillColor: Colors.yellow.withOpacity(0.15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draw polygon'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(53.20127189893239, 16.39832562876689),
          zoom: 14,
        ),
        mapType: MapType.hybrid,
        polygons: _polygons,
        myLocationEnabled: false,
      ),
    );
  }
}
