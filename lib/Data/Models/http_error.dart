class HttpError implements Exception{
  final String? errorCode;
  final String? errorMsg;
  final String? errorDetails;

  HttpError({this.errorCode, this.errorMsg, this.errorDetails});

    factory HttpError.fromJson(Map<String, dynamic> json) => HttpError(
        errorCode: json["code"].toString(),
        errorMsg: json["message"],
        errorDetails: json["developerMessaage"],
    );

  @override
  String toString() => 'Error code: $errorCode \n message: $errorMsg';

}