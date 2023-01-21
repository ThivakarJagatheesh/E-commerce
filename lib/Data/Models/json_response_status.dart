class JsonResponseStatus implements Exception{
  final int?  status;
  final int?  code;
  final String? message;
  final String? developerMessage;

  JsonResponseStatus({this.status, this.code, this.message,this.developerMessage});

    factory JsonResponseStatus.fromJson(Map<String, dynamic> json) => JsonResponseStatus(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        developerMessage:json['developerMessage'],
    );
//message":"Sorry, Coupon is Not Available","coupon_code"
  @override
  String toString() => 'Error Code $code \nMessage: $developerMessage';

}