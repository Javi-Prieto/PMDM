import 'dart:convert';

import 'avatar.dart';

class AccountDetailsResponse {
	Avatar? avatar;
	int? id;
	String? iso6391;
	String? iso31661;
	String? name;
	bool? includeAdult;
	String? username;

	AccountDetailsResponse({
		this.avatar, 
		this.id, 
		this.iso6391, 
		this.iso31661, 
		this.name, 
		this.includeAdult, 
		this.username, 
	});

	factory AccountDetailsResponse.fromMap(Map<String, dynamic> data) {
		return AccountDetailsResponse(
			avatar: data['avatar'] == null
						? null
						: Avatar.fromMap(data['avatar'] as Map<String, dynamic>),
			id: data['id'] as int?,
			iso6391: data['iso_639_1'] as String?,
			iso31661: data['iso_3166_1'] as String?,
			name: data['name'] as String?,
			includeAdult: data['include_adult'] as bool?,
			username: data['username'] as String?,
		);
	}



	Map<String, dynamic> toMap() => {
				'avatar': avatar?.toMap(),
				'id': id,
				'iso_639_1': iso6391,
				'iso_3166_1': iso31661,
				'name': name,
				'include_adult': includeAdult,
				'username': username,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AccountDetailsResponse].
	factory AccountDetailsResponse.fromJson(String data) {
		return AccountDetailsResponse.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [AccountDetailsResponse] to a JSON string.
	String toJson() => json.encode(toMap());
}
