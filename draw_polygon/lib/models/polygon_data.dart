import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<List<List<LatLng>>> parsePolygon() async {
  try{
    Map<String, dynamic> map = await _parseJsonFromAssets("assets/data/field.json");
    String s = map["geom"].toString().substring(map["geom"].toString().indexOf(";") + 1,map["geom"].toString().length);

    String s1 = s.substring(s.indexOf("((") + 2, s.indexOf("),"));
    String s2 = s.substring(s.indexOf("),") + 4 , s.length - 2);

    List<String> p1 = s1.split(', ');
    List<String> p2 = s2.split(', ');
    List<LatLng> polygon1 = _getListOfPoints(p1);
    List<LatLng> polygon2 = _getListOfPoints(p2);

    return [polygon1, polygon2];
  }catch(e){
    print('Exception appear: ' + e.toString());
  }

  return [];
}

Future<Map<String, dynamic>> _parseJsonFromAssets(String assetsPath) async {
  WidgetsFlutterBinding.ensureInitialized();
  return rootBundle.loadString(assetsPath)
      .then((jsonStr) => json.decode(jsonStr));
}

List<LatLng> _getListOfPoints(List<String> points){
  List<LatLng> list = [];
  for(String p in points){
    list.add(_getPoint(p));
  }
  return list;
}

LatLng _getPoint(String stringPoint){
  List<String> values = stringPoint.split(' ');
  return LatLng(double.parse(values[1]), double.parse(values[0]));
}