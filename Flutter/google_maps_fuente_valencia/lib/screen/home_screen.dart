import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_fuente_valencia/models/valencias_font_response/geo_point2d.dart';
import 'package:google_maps_fuente_valencia/models/valencias_font_response/result.dart';
import 'package:google_maps_fuente_valencia/models/valencias_font_response/valencias_font_response.dart';
import 'package:google_maps_fuente_valencia/service/font_service.dart';
import 'package:google_maps_fuente_valencia/widgets/place_marker_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Response response;
  List<Result> fonts = [];
  List<GeoPoint2d> list = [];

  @override
  void initState() {
    super.initState();
    Provider.of<FontService>(context, listen: false)
        .fetchValenciasFontResponse()
        .then((value) {
      setState(() {
        response = value;
        fonts = ValenciasFontResponse.fromJson(response.body!).results!;
        for (var element in fonts) {
          list.add(element.geoPoint2d!);
        }
      });
    }).onError((error, stackTrace) {
      print('mierror: ' + error.toString());
      print('mytrack: ' + stackTrace.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Valencias Fonts'),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: false,
        children: [
          const Text(
            'Where Are the Main Fonts in Valencia?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          list.isEmpty
              ? const CircularProgressIndicator()
              : PlaceMarkerItem(markersPointer: list)
        ],
      ),
    );
  }
}
