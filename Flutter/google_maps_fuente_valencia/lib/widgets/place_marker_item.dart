import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_fuente_valencia/models/valencias_font_response/geo_point2d.dart';

class PlaceMarkerItem extends StatefulWidget {
  const PlaceMarkerItem({super.key, required this.markersPointer});
  final List<GeoPoint2d> markersPointer;
  
  @override
  State<PlaceMarkerItem> createState() => PlaceMarkerItemState();
}


typedef MarkerUpdateAction = Marker Function(Marker marker);

class PlaceMarkerItemState extends State<PlaceMarkerItem> {
  static const LatLng center = LatLng(-33.86711, 151.1947171);
  Map<MarkerId, Marker> markers = {};
  Map<MarkerId, Marker> markersNew = {};
  @override
  void initState() {
    super.initState();
    int i = 0;
    for (var geoPoint in widget.markersPointer) {
      markersNew.addAll({MarkerId('$i'): Marker(markerId: MarkerId('$i'), position: LatLng(geoPoint.lat!, geoPoint.lon!))});
      i++;
    }

    setState(() {
      markers.addAll(markersNew);
    });
  }
  
  GoogleMapController? controller;
  
  
  MarkerId? selectedMarker;
  LatLng? markerPosition;
  

  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<LatLng> listLatLong = List.empty();
    for (var element in widget.markersPointer) {
        listLatLong.add(LatLng(element.lat!, element.lon!));
     }
    return Stack(children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 600,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: LatLng(37.380503603368595, -6.007599131696968),
                zoom: 15.0,
              ),
              markers: Set<Marker>.of(markers.values),
            ),
          ),
        ],
      ),
      Visibility(
        visible: markerPosition != null,
        child: Container(
          color: Colors.white70,
          height: 30,
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              if (markerPosition == null)
                Container()
              else
                Expanded(child: Text('lat: ${markerPosition!.latitude}')),
              if (markerPosition == null)
                Container()
              else
                Expanded(child: Text('lng: ${markerPosition!.longitude}')),
            ],
          ),
        ),
      ),
    ]);
  }
}