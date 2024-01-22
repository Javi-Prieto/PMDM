import 'dart:convert';

import 'result.dart';

class PopularPeopleResponse {
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  PopularPeopleResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory PopularPeopleResponse.fromMap(Map<String, dynamic> data) {
    return PopularPeopleResponse(
      page: data['page'] as int?,
      results: (data['results'] as List<dynamic>?)
          ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
          .toList(),
      totalPages: data['total_pages'] as int?,
      totalResults: data['total_results'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'page': page,
        'results': results?.map((e) => e.toMap()).toList(),
        'total_pages': totalPages,
        'total_results': totalResults,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PopularPeopleResponse].
  factory PopularPeopleResponse.fromJson(String data) {
    return PopularPeopleResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PopularPeopleResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
