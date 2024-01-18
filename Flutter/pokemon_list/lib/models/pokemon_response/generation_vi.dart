import 'dart:convert';

import 'package:collection/collection.dart';

import 'omegaruby_alphasapphire.dart';
import 'xy.dart';

class GenerationVi {
  OmegarubyAlphasapphire? omegarubyAlphasapphire;
  Xy? xY;

  GenerationVi({this.omegarubyAlphasapphire, this.xY});

  factory GenerationVi.fromMap(Map<String, dynamic> data) => GenerationVi(
        omegarubyAlphasapphire: data['omegaruby-alphasapphire'] == null
            ? null
            : OmegarubyAlphasapphire.fromMap(
                data['omegaruby-alphasapphire'] as Map<String, dynamic>),
        xY: data['x-y'] == null
            ? null
            : Xy.fromMap(data['x-y'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'omegaruby-alphasapphire': omegarubyAlphasapphire?.toMap(),
        'x-y': xY?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GenerationVi].
  factory GenerationVi.fromJson(String data) {
    return GenerationVi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GenerationVi] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GenerationVi) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => omegarubyAlphasapphire.hashCode ^ xY.hashCode;
}
