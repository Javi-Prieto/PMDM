import 'dart:convert';

import 'result.dart';

class ValenciasFontResponse {
  int? totalCount;
  List<Result>? results;

  ValenciasFontResponse({this.totalCount, this.results});

  factory ValenciasFontResponse.fromMap(Map<String, dynamic> data) {
    return ValenciasFontResponse(
      totalCount: data['total_count'] as int?,
      results: (data['results'] as List<dynamic>?)
          ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'total_count': totalCount,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ValenciasFontResponse].
  factory ValenciasFontResponse.fromJson(String data) {
    return ValenciasFontResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ValenciasFontResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
