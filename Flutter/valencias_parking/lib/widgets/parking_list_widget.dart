import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skeletonizer/skeletonizer.dart';
import 'package:valencias_parking/models/parking_list/parking_list.dart';
import 'package:valencias_parking/widgets/parking_item.dart';

Future<ParkingListResponse> fetchParking() async {
  final response = await http.get(Uri.parse(
      'https://valencia.opendatasoft.com/api/explore/v2.1/catalog/datasets/parkings/records?limit=20'));
  if (response.statusCode == 200) {
    final toReturn = ParkingListResponse.fromJson(response.body);
    return toReturn;
  } else {
    throw Exception('Failed to load album');
  }
}

class ParkingList extends StatefulWidget {
  const ParkingList({super.key});

  @override
  State<ParkingList> createState() => _ParkingListState();
}

class _ParkingListState extends State<ParkingList> {
  late Future<ParkingListResponse> parkingResponse;
  @override
  void initState() {
    super.initState();
    parkingResponse = fetchParking();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder<ParkingListResponse>(
        future: parkingResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Skeletonizer(
                enabled: false,
                child: ListView.builder(itemBuilder: (context, index) {
                  return ParkingItem(
                    parking: snapshot.data!.results![index],
                  );
                }));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
