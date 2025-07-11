import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../model/entity/auth/auth.dart';
import '../../../model/request/login_request.dart';
import '../../../model/request/sms_login_request.dart';
import '../../../model/request/send_sms_request.dart';
import '../../../model/response/base/base_response.dart';

part 'auth_api.g.dart';

/// 认证相关接口
@RestApi(baseUrl: 'user/auth')
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  /// 密码登录
  @POST('/password')
  Future<BaseResponse<Auth>> loginByPassword(
    @Body() LoginRequest request,
  );

  /// 短信验证码登录
  @POST('/sms')
  Future<BaseResponse<Auth>> loginBySms(
    @Body() SmsLoginRequest request,
  );

  /// 发送短信验证码
  @POST('/send-sms')
  Future<BaseResponse<void>> sendSmsCode(
    @Body() SendSmsRequest request,
  );

  /// 获取图片验证码
  @GET('/captcha')
  Future<BaseResponse<Map<String, dynamic>>> getCaptcha();
}
