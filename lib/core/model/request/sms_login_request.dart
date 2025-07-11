import 'package:json_annotation/json_annotation.dart';

part 'sms_login_request.g.dart';

/// 短信验证码登录请求模型
@JsonSerializable()
class SmsLoginRequest {
  /// 手机号
  final String phone;

  /// 短信验证码
  final String smsCode;

  const SmsLoginRequest({
    this.phone = '',
    this.smsCode = '',
  });

  /// 从 JSON 创建实例
  factory SmsLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$SmsLoginRequestFromJson(json);

  /// 转换为 JSON
  Map<String, dynamic> toJson() => _$SmsLoginRequestToJson(this);
}