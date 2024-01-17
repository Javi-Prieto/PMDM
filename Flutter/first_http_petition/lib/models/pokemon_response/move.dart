import 'dart:convert';

import 'package:collection/collection.dart';

import 'move.dart';
import 'version_group_detail.dart';

class Move {
  Move? move;
  List<VersionGroupDetail>? versionGroupDetails;

  Move({this.move, this.versionGroupDetails});

  factory Move.fromMap(Map<String, dynamic> data) => Move(
        move: data['move'] == null
            ? null
            : Move.fromMap(data['move'] as Map<String, dynamic>),
        versionGroupDetails: (data['version_group_details'] as List<dynamic>?)
            ?.map((e) => VersionGroupDetail.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'move': move?.toMap(),
        'version_group_details':
            versionGroupDetails?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Move].
  factory Move.fromJson(String data) {
    return Move.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Move] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Move) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => move.hashCode ^ versionGroupDetails.hashCode;
}
