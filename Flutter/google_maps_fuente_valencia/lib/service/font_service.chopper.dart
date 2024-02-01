// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'font_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$FontService extends FontService {
  _$FontService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = FontService;

  @override
  Future<Response<dynamic>> fetchValenciasFontResponse() {
    final Uri $url =
        Uri.parse('fonts-daigua-publica-fuentes-de-agua-publica/records');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
