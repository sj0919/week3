import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7F7), // Light pink background
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 로고와 문구 추가
                Column(
                  children: [
                    Image.asset(
                      'assets/pingdumbell_logo.png', // 로고 이미지 경로
                      width: 300,
                      height: 300,
                    ),
                    SizedBox(height: 0.0),

                  ],
                ),
                SizedBox(height: 0.0),
                // 아이디 입력 필드
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '아이디',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 14.0),
                // 비밀번호 입력 필드
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '비밀번호',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                // 로그인 버튼
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/main'); // Navigate to My Page
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFDCDC), // Light pink button background
                    minimumSize: Size(double.infinity, 40), // Full-width button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      color: Colors.black, // Button text color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                // 회원가입/아이디 찾기 버튼
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup'); // Navigate to Signup Page
                  },
                  child: Text(
                    '회원가입 / 아이디 찾기',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                // 카카오 로그인 버튼
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/kakao-login'); // Add Kakao login logic
                  },
                  icon: Image.asset(
                    'assets/kakao_icon.png', // Replace with your Kakao icon asset path
                    height: 15,
                    width: 20,
                  ),
                  label: Text(
                    '카카오로 시작하기',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFE812), // Kakao yellow button
                    minimumSize: Size(double.infinity, 40), // Full-width button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
