import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7F7), // Light pink background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '아이디',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 14.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '비밀번호',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 18.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/my'); // Navigate to My Page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFDCDC), // Light pink button background
                  minimumSize: Size(double.infinity, 45), // Full-width button
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
              SizedBox(height: 10.0),
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
              SizedBox(height: 20.0),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/kakao-login'); // Add Kakao login logic
                },
                icon: Image.asset(
                  'assets/kakao_icon.png', // Replace with your Kakao icon asset path
                  height: 20,
                  width: 20,
                ),
                label: Text(
                  '카카오로 시작하기',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFE812), // Kakao yellow button
                  minimumSize: Size(double.infinity, 45), // Full-width button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
