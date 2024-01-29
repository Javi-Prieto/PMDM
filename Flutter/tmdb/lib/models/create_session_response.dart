import 'dart:convert';

class CreateSessionResponse {
	bool? success;
	String? sessionId;

	CreateSessionResponse({this.success, this.sessionId});

	factory CreateSessionResponse.fromMap(Map<String, dynamic> data) {
		return CreateSessionResponse(
			success: data['success'] as bool?,
			sessionId: data['session_id'] as String?,
		);
	}



	Map<String, dynamic> toMap() => {
				'success': success,
				'session_id': sessionId,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreateSessionResponse].
	factory CreateSessionResponse.fromJson(String data) {
		return CreateSessionResponse.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [CreateSessionResponse] to a JSON string.
	String toJson() => json.encode(toMap());
}
