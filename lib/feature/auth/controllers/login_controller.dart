import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_td_getx_template/core/base/base_logic.dart';
import 'package:flutter_td_getx_template/feature/auth/data/auth_api.dart';
import 'package.dart';

class LoginController extends BaseLogic {
  final AuthApi _authApi = Get.find<AuthApi>();

  final phoneController = TextEditingController();
  final captchaController = TextEditingController();
  final smsCodeController = TextEditingController();

  final captchaImage = Rx<Uint8List?>(null);
  String captchaId = '';

  final canSendSms = false.obs;
  final canLogin = false.obs;
  final countdown = 0.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(_onInputChanged);
    captchaController.addListener(_onInputChanged);
    smsCodeController.addListener(_onInputChanged);
    getCaptcha();
  }

  @override
  void onClose() {
    _timer?.cancel();
    phoneController.removeListener(_onInputChanged);
    captchaController.removeListener(_onInputChanged);
    smsCodeController.removeListener(_onInputChanged);
    phoneController.dispose();
    captchaController.dispose();
    smsCodeController.dispose();
    super.onClose();
  }

  void _onInputChanged() {
    canSendSms.value = phoneController.text.length == 11 && captchaController.text.length == 4;
    canLogin.value = phoneController.text.length == 11 &&
        captchaController.text.length == 4 &&
        smsCodeController.text.length == 6;
  }

  /// 获取图片验证码
  Future<void> getCaptcha() async {
    final result = await _authApi.getCaptcha();
    result.fold(
      (l) => showToast(l.message),
      (r) {
        captchaImage.value = r.imgBytes;
        captchaId = r.captchaId;
      },
    );
  }

  /// 发送短信验证码
  Future<void> sendSmsCode() async {
    if (!canSendSms.value || countdown.value > 0) return;

    final request = SendSmsRequest(
      phone: phoneController.text,
      captcha: captchaController.text,
      captchaId: captchaId,
    );

    final result = await _authApi.sendSmsCode(request);
    result.fold(
      (l) {
        showToast(l.message);
        getCaptcha(); // 发送失败时，刷新图片验证码
      },
      (r) {
        showToast('短信验证码已发送');
        _startCountdown();
      },
    );
  }

  void _startCountdown() {
    countdown.value = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        _timer?.cancel();
        _timer = null;
      }
    });
  }

  /// 登录
  Future<void> login() async {
    if (!canLogin.value) return;

    final request = SmsLoginRequest(
      phone: phoneController.text,
      smsCode: smsCodeController.text,
    );

    final result = await _authApi.loginBySms(request);
    result.fold(
      (l) => showToast(l.message),
      (r) {
        showToast('登录成功');
        // TODO: 跳转到主页
      },
    );
  }
}