import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              // 标题
              const Text(
                '手机号',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              
              // 手机号输入
              _buildPhoneInput(),
              const SizedBox(height: 24),
              
              // 图片验证码输入
              _buildCaptchaInput(),
              const SizedBox(height: 24),
              
              // 短信验证码输入
              _buildSmsCodeInput(),
              const SizedBox(height: 48),
              
              // 登录按钮
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  /// 手机号输入框
Widget _buildPhoneInput() {
  return TDInput(
    controller: controller.phoneController,
    hintText: '请输入手机号',
    height: 56,
    borderRadius: BorderRadius.circular(12),
    style: const TextStyle(fontSize: 20, color: Color(0xFF2A2A2A)),
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE7E7E7)),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
    ),
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(11),
    ],
  );
}

  /// 图片验证码输入框
  Widget _buildCaptchaInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '图片验证码',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TDInput(
                controller: controller.captchaController,
                hintText: '请输入验证码',
                inputFormatters: [
                  LengthLimitingTextInputFormatter(4),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // 验证码图片
            Obx(() => GestureDetector(
              onTap: controller.getCaptcha,
              child: Container(
                width: 120,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: controller.captchaImage.value != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.memory(
                          controller.captchaImage.value!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Center(
                        child: Text(
                          '获取验证码',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
              ),
            )),
          ],
        ),
      ],
    );
  }

  /// 短信验证码输入框
  Widget _buildSmsCodeInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '短信验证码',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TDInput(
                controller: controller.smsCodeController,
                hintText: '请输入短信验证码',
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // 发送验证码按钮
            Obx(() {
              final isCountingDown = controller.countdown.value > 0;
              final canSend = controller.canSendSms.value && !isCountingDown;
              return SizedBox(
                width: 120,
                height: 48,
                child: TDButton(
                  text: isCountingDown
                      ? '已发送 ${controller.countdown.value}s'
                      : '发送验证码',
                  size: TDButtonSize.medium,
                  type: TDButtonType.fill,
                  onTap: canSend ? controller.sendSmsCode : null,
                ),
              );
            }),
          ],
        ),
      ],
    );
  }

  /// 登录按钮
  Widget _buildLoginButton() {
    return Obx(() => SizedBox(
          width: double.infinity,
          height: 52,
          child: TDButton(
            text: '登录 / 注册',
            size: TDButtonSize.large,
            type: TDButtonType.fill,
            shape: TDButtonShape.round,
            onTap: controller.canLogin.value ? controller.login : null,
          ),
        ));
  }
}