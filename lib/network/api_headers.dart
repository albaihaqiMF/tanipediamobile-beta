import 'api_url.dart';

class ApiHeaders {
  final String apiToken;
  ApiHeaders(this.apiToken);

  static Map<String, String> headers = {
    'Content-Type': ApiUrl.contentType,
    'APP-KEY': ApiUrl.appKey,
    // 'Authorization': 'Gradien $apiToken'
  };

// headers(String apiToken){
//    static Map<String, String> headers = {
//     'Content-Type': ApiUrl.contentType,
//     'APP-KEY': ApiUrl.appKey,
//     'Authorization':
//         'Gradien 859a37720c27b9f70e11b79bab9318feUwX9Eow8udCeXuWmAKgD1b43rJGCzVPKTwo9FBAyQPriNwlVjTzwi8HJRKa180OqToY1hjIHYeExOEP9LhobEAAX5u6YZEUcqCfkgpEfIN4wqxLGvNKCSqabIYgq4t5m'
//   };

// }

}
