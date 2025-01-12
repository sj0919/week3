import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyProfilePage(),
    );
  }
}

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7F7), // Light pink background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '마이페이지',
          style: TextStyle(color: Colors.black,fontSize:17),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              // Profile Section
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50.0,

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
              // My Info Section
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
                        SizedBox(width: 15.0),
                        Text(
                          '오늘 걸은 걸음수',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Icon(Icons.height, color: Colors.grey),
                        SizedBox(width: 15.0),
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
              // My Activities Section
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
              // Miscellaneous Section
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
                        // Customer service logic
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings, color: Colors.grey),
                      title: Text('앱 관리'),
                      onTap: () {
                        // App management logic
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.grey),
                      title: Text('로그아웃'),
                      onTap: () {
                        // Logout logic
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.delete_outline, color: Colors.grey),
                      title: Text('회원탈퇴'),
                      onTap: () {
                        // Account deletion logic
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
