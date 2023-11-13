class ImageToSign{
  String? name;
  String? imageInsightsToken;
  String? thumbnailUri;
  String? webSearchUri;
  String? contentUrl;
  String? encodingFormat;

  ImageToSign();

  ImageToSign.fromMap(Map<String, dynamic> json) {
    name = json["name"];
    imageInsightsToken = json["imageInsightsToken"];
    thumbnailUri = json["thumbnailUrl"];
    webSearchUri = json["webSearchUrl"];
    contentUrl = json["contentUrl"];
    encodingFormat = json["encodingFormat"];
  }
}