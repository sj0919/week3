import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7F7), // 연한 분홍색 배경
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '마이페이지',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              // 프로필 섹션
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150', // 프로필 이미지 URL
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '물입캠프',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      '만 23세/여',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      'seungjinlee09@naver.com',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              // 나의 정보 섹션
              Text(
                '나의 정보',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.directions_walk, color: Colors.grey),
                        SizedBox(width: 15.0), // 간격 조정
                        Text(
                          '오늘 걸은 걸음수',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0), // 간격 추가
                    Row(
                      children: [
                        Icon(Icons.height, color: Colors.grey),
                        SizedBox(width: 15.0), // 간격 조정
                        Text(
                          '키 155 / 몸무게 48',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.0),
              // 나의 활동 섹션
              Text(
                '나의 활동',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 100.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    '나의 활동 내용',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              // 기타 섹션
              Text(
                '기타',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.help_outline, color: Colors.grey),
                      title: Text('고객센터/운영정책'),
                      onTap: () {
                        // 고객센터 로직 추가
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings, color: Colors.grey),
                      title: Text('앱 관리'),
                      onTap: () {
                        // 앱 관리 로직 추가
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.grey),
                      title: Text('로그아웃'),
                      onTap: () {
                        // 로그아웃 로직 추가
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.delete_outline, color: Colors.grey),
                      title: Text('회원탈퇴'),
                      onTap: () {
                        // 회원탈퇴 로직 추가
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_walk),
            label: '운동',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: 2, // 현재 페이지 인덱스
        onTap: (index) {
          // 바텀 네비게이션 로직 추가
        },
      ),
    );
  }
}
