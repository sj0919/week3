import 'package:flutter/material.dart';
import 'package:week3/pages/splash.dart'; // 스플래시 페이지 import
import 'package:week3/pages/login.dart'; // 로그인 페이지 import
import 'package:week3/pages/home.dart';
import 'package:week3/pages/chart.dart';
import 'package:week3/pages/exercise.dart';
import 'package:week3/pages/my.dart';
import 'package:week3/pages/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash', // 초기 화면을 스플래시 페이지로 설정
      routes: {
        '/splash': (context) => SplashScreen(), // 스플래시 페이지
        '/login': (context) => LoginPage(), // 로그인 페이지
        '/signup': (context) => SignUpPage(), // 회원가입 페이지
        '/main': (context) => MainScreen(), // 메인 화면
      },
    );
  }
}


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    ChartPage(),
    ExercisePage(),
    MyProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: '차트'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_walk), label: '운동'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
        ],
      ),
    );
  }
}