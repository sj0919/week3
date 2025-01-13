import 'package:flutter/material.dart';

class ChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '운동 자극받기',
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
              SizedBox(height: 10),
              // 첫 번째 질문
              Text(
                "운동 자극을 받고 싶으신가요?\n그렇다면 당장 입력하세요",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height:26),
              Text(
                "하루에 밥은 몇끼 먹나요?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 30),
              Image.asset(
                'assets/rice.png', // 밥 이미지 경로
                height: 100,
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5, // 화면의 50% 너비
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // 둥근 테두리 설정
                        borderSide: BorderSide(color: Color(0xFFFFE0E0)), // 기본 테두리 색상
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFFFFE0E0)), // 활성화 상태 테두리 색상
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFFFFE0E0), width: 2.0), // 포커스 상태 테두리 색상
                      ),
                      hintText: '숫자를 입력하세요',
                      hintStyle: TextStyle(color: Colors.grey), // 힌트 텍스트 색상 설정
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10), // 높이 조정
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(height: 30),

              // 두 번째 질문
              Text(
                "간식은 몇 번 먹었나요?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Image.asset(
                'assets/exercise.png', // 과자 이미지 경로
                height: 100,
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5, // 화면의 50% 너비
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFFFFE0E0)), // 기본 테두리 색상
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFFFFE0E0)), // 활성화 상태 테두리 색상
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFFFFE0E0), width: 2.0), // 포커스 상태 테두리 색상
                      ),
                      hintText: '숫자를 입력하세요',
                      hintStyle: TextStyle(color: Colors.grey), // 힌트 텍스트 색상 설정
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10), // 높이 조정
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(height: 30),

              // 세 번째 질문
              Text(
                "일주일에 운동은 몇번 하나요?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Image.asset(
                'assets/snack.png', // 운동 이미지 경로
                height: 100,
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5, // 화면의 50% 너비
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFFFFE0E0)), // 기본 테두리 색상
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFFFFE0E0)), // 활성화 상태 테두리 색상
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xFFFFE0E0), width: 2.0), // 포커스 상태 테두리 색상
                      ),
                      hintText: '횟수를 입력하세요',
                      hintStyle: TextStyle(color: Colors.grey), // 힌트 텍스트 색상 설정
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10), // 높이 조정
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              // 완료 버튼
              ElevatedButton(
                onPressed: () {
                  // 버튼 클릭 시 빈 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFE0E0),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "심각성 테스트",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "결과 페이지",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img.png', // img.png 이미지 경로
              height: 400, // 이미지 높이
              width: 400,  // 이미지 너비
              fit: BoxFit.contain, // 이미지 비율 유지
            ),
            SizedBox(height: 20),
            Text(
              "심각합니다. 당장 운동하러가세요!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}