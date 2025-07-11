import 'package:json_annotation/json_annotation.dart';

part 'send_sms_request.g.dart';

/// 发送短信验证码请求模型
@JsonSerializable()
class SendSmsRequest {
  /// 手机号
  final String phone;

  /// 图片验证码
  final String captcha;

  /// 验证码ID
  final String captchaId;

  const SendSmsRequest({
    this.phone = '',
    this.captcha = '',
    this.captchaId = '',
  });

  /// 从 JSON 创建实例
  factory SendSmsRequest.fromJson(Map<String, dynamic> json) =>
      _$SendSmsRequestFromJson(json);

  /// 转换为 JSON
  Map<String, dynamic> toJson() => _$SendSmsRequestToJson(this);
}