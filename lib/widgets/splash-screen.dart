import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seniorplus/screens/main-screen.dart';
import 'package:seniorplus/screens/sign-up-screen.dart';
import 'package:seniorplus/widgets/button.dart';
import 'package:seniorplus/widgets/description.dart';
import 'package:seniorplus/widgets/title-name.dart';
import '../screens/home-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds before navigating to HomeScreen
    // Timer(const Duration(seconds: 0), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => const MainScreen()),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    void goToSignUpScreen() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      );
    }

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: const TitleName(
                      text: 'Welcome to Senior Plus!', size: 24)),
              Container(
                padding: const EdgeInsets.fromLTRB(100, 50, 100, 50),
                child: const Description(
                    text:
                        'To facailitate and improve the care of the elderly issimple'),
              ),
              Image.asset('assets/images/symbol.png'),
              Container(
                padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
                child: Button(
                  text: 'Bắt đầu',
                  onPressed: goToSignUpScreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
