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

  @override
  initState() {
    super.initState();
    Provider.of<FontService>(context, listen: false).fetchValenciasFontResponse().then((value) {
      setState(() {
        response = value;  
        fonts = ValenciasFontResponse.fromJson(response.body!).results!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<GeoPoint2d> list = List.empty();
    fonts.forEach((element) {
      list.add(element.geoPoint2d!);
    },);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salesianos Location'),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: false,
        children: [
          const Text(
            'Where are Salesianos Triana',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          PlaceMarkerItem(markersPointer: list)
        ],
      ),
    );
  }
}
