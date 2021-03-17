class Response {
  String status;
  String message;
  dynamic data;

  Response({this.status, this.message, this.data});

  factory Response.fromJSON(Map<dynamic, dynamic> json) {
    return Response(
        status: json['status'], message: json['message'], data: json['data']);
  }
}
