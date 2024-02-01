import 'package:chopper/chopper.dart';
part 'font_service.chopper.dart';

@ChopperApi()
abstract class FontService extends ChopperService {
  static FontService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(
          'https://valencia.opendatasoft.com/api/explore/v2.1/catalog/datasets/'),
      services: [_$FontService()],
    );
    return _$FontService(client);
  }

  @Get(path: 'fonts-daigua-publica-fuentes-de-agua-publica/records')
  Future<Response> fetchValenciasFontResponse();
}
