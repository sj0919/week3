import 'package:flutter/material.dart';
import 'package:week3/pages/login.dart';
import 'package:week3/pages/signup.dart';
import 'package:week3/pages/my.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // 초기 화면 설정
      routes: {
        '/': (context) => LoginPage(), // 로그인 페이지
        '/signup': (context) => SignUpPage(), // 회원가입 페이지
        '/my': (context) => MyPage(),
      },
    );
  }
}
