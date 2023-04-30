import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorplus/widgets/button.dart';
import 'package:seniorplus/widgets/input.dart';
import 'package:dio/dio.dart';
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TitleName(text: 'Đăng nhập', size: 18),
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
                  text: 'Đăng ký',
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    await signUp(email, password);
                  },
                ),
                const SizedBox(height: 50),
                const Text(
                  '- hoặc đăng kí bằng -',
                  style: TextStyle(color: Colors.grey),
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
                    TitleName(text: 'Đăng nhập', size: 16)
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
