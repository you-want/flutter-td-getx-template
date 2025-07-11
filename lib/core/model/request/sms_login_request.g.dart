// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmsLoginRequest _$SmsLoginRequestFromJson(Map<String, dynamic> json) =>
    SmsLoginRequest(
      phone: json['phone'] as String? ?? '',
      smsCode: json['smsCode'] as String? ?? '',
    );

Map<String, dynamic> _$SmsLoginRequestToJson(SmsLoginRequest instance) =>
    <String, dynamic>{'phone': instance.phone, 'smsCode': instance.smsCode};
