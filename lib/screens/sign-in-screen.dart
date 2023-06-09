import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/constants/colors.dart';
import 'package:seniorplus/screens/main-screen.dart';
import 'package:seniorplus/widgets/button.dart';
import 'package:seniorplus/widgets/input.dart';
import 'package:dio/dio.dart';
import 'package:seniorplus/widgets/shader-text.dart';
import 'package:seniorplus/widgets/title-name.dart';

import '../main.dart';
import '../widgets/social-button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final _emailController = TextEditingController();
  late final _passwordController = TextEditingController();
  final dio = Dio(BaseOptions(
    baseUrl: 'https://example.com/api/',
  ));
  Future<void> signUp(String email, String password) async {
    try {
      final response = await dio.post('signup', data: {
        'email': email,
        'password': password,
      });
      // Handle the response
    } catch (e) {
      // Handle the error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ShaderText(
                  text: 'Đăng nhập',
                  size: 18,
                  fontBold: true,
                  center: false,
                ),
                const SizedBox(height: 16),
                Input(
                  hintText: 'Nhập email',
                  icon: 'assets/images/mail.png',
                  type: 'text',
                  label: 'Email',
                  controller: _emailController,
                ),
                const SizedBox(height: 16),
                Input(
                  hintText: 'Nhập mật khẩu',
                  icon: 'assets/images/lock.png',
                  type: 'password',
                  label: 'Mật khẩu',
                  controller: _passwordController,
                ),
                const SizedBox(height: 30),
                Button(
                  text: 'Đăng nhập',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                    );
                  },
                ),
                const SizedBox(height: 50),
                const Text(
                  '- hoặc đăng kí bằng -',
                  style: TextStyle(color: Color(HINT_TEXT)),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SocialButton(
                      image: 'assets/images/apple.png',
                    ),
                    SocialButton(
                      image: 'assets/images/facebook.png',
                    ),
                    SocialButton(
                      image: 'assets/images/google.png',
                    )
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('Đã có sẵn tài khoản? '),
                    ShaderText(
                      text: 'Đăng nhập',
                      size: 16,
                      fontBold: true,
                      center: false,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
