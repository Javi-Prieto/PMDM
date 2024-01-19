import 'dart:convert';

import 'result.dart';

class ParkingListResponse {
  int? totalCount;
  List<Result>? results;

  ParkingListResponse({this.totalCount, this.results});

  factory ParkingListResponse.fromMap(Map<String, dynamic> data) => ParkingListResponse(
        totalCount: data['total_count'] as int?,
        results: (data['results'] as List<dynamic>?)
            ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'total_count': totalCount,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ParkingListResponse].
  factory ParkingListResponse.fromJson(String data) {
    return ParkingListResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ParkingListResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
