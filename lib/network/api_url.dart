class ApiUrl {
  // Initial Setup
  static const baseURL = "https://b7ace458bd89.ngrok.io/";
  static const contentType = 'application/json';
  static const appKey = 'okYC7opyhD4DTIauhPvMq2Wkvc6bz08t';

  // Header
  static Map<String, String> headers = {
    'Content-Type': ApiUrl.contentType,
    'APP-KEY': ApiUrl.appKey,
  };

  // End Point URL
  static const register = "register";

  // SharedPref Key-Value
  static const apiToken = 'apiToken';
}
