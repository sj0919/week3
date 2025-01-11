import 'package:flutter/material.dart';

class ChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '차트',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              // 상단 텍스트
              Text(
                "00님, 오늘도 운동을 도전해볼까요?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // 이미지와 텍스트
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFF9F9F9), // 연한 회색 배경
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // 운동 이미지
                    // Image.asset(
                    //   'assets/exercise_icon.png', // 이미지 경로
                    //   height: 150,
                    // ),
                    SizedBox(height: 16),
                    // 텍스트
                    Text(
                      "앉았다 일어나세요.\n지금 당장!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
