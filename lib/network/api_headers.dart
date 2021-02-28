import 'api_url.dart';

Map<String, String> apiHeaders(String apiToken) {
  if (apiToken == null) {
    return {
      'Content-Type': ApiUrl.contentType,
      'APP-KEY': ApiUrl.appKey,
    };
  } else {
    return {
      'Content-Type': ApiUrl.contentType,
      'APP-KEY': ApiUrl.appKey,
      'Authorization': 'Gradien $apiToken'
    };
  }
}
