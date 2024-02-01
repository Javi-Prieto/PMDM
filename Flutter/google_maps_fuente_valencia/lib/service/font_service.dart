import 'package:chopper/chopper.dart';
import 'package:google_maps_fuente_valencia/models/valencias_font_response/valencias_font_response.dart';
part 'font_service.chopper.dart';

@ChopperApi()
abstract class FontService extends ChopperService {


  static FontService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://valencia.opendatasoft.com/api/explore/v2.1/catalog/datasets/'),
      services: [_$FontService()],
      converter: const JsonConverter(),
    );
    return _$FontService(client);
  }

  @Get(path: 'fonts-daigua-publica-fuentes-de-agua-publica/records?limit=20')
  Future<Response> fetchValenciasFontResponse();

}