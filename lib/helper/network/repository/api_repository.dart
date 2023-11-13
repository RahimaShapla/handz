import 'package:handz/helper/network/apiprovider/api_provider.dart';
import '../model/signtoimage.dart';

class APIRepository {
  final ApiProviders? _apiProvider;

  APIRepository(this._apiProvider);

 Future<List<ImageToSign>> getImageToTextResponse(file) async {
    return await _apiProvider!.imageToTextResponse(file);
  }

}
