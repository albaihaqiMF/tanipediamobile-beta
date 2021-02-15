class ApiUrl {
  // Initial Setup
  static const baseURL = "https://99f7fca3bd1c.ngrok.io/";
  static const contentType = 'application/json';
  static const appKey = 'okYC7opyhD4DTIauhPvMq2Wkvc6bz08t';

  // Header
  static Map<String, String> headersAuth = {
    'Content-Type': ApiUrl.contentType,
    'APP-KEY': ApiUrl.appKey,
    'Authorization':
        'Gradien 859a37720c27b9f70e11b79bab9318feUwX9Eow8udCeXuWmAKgD1b43rJGCzVPKTwo9FBAyQPriNwlVjTzwi8HJRKa180OqToY1hjIHYeExOEP9LhobEAAX5u6YZEUcqCfkgpEfIN4wqxLGvNKCSqabIYgq4t5m'
  };

  static Map<String, String> headers = {
    'Content-Type': ApiUrl.contentType,
    'APP-KEY': ApiUrl.appKey,
  };

  // End Point URL
  static const register = "register";
  static const profile = "profil";
}
