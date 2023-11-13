import 'package:dio/dio.dart';
import 'package:handz/helper/network/app_urls.dart';
import 'package:image_picker/image_picker.dart';
import '../api_base_helper.dart';
import '../model/signtoimage.dart';

class ApiProviders extends ApiBaseHelper {
  Future<List<ImageToSign>> imageToTextResponse(XFile file) async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        file.path,
      ),
    });
    Response response = await get(uploadImageFile, formData);
    var responseList = List<ImageToSign>.from(
        response.data.map((x) => ImageToSign.fromMap(x)));
    return responseList;
  }
}
