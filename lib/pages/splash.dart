import 'package:flutter/material.dart';
import 'dart:math';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    // 첫 번째 덤벨 애니메이션
    _controller1 = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation1 = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: -200, end: 300)
            .chain(CurveTween(curve: Curves.bounceOut)),
        weight: 100,
      ),
    ]).animate(_controller1);

    // 두 번째 덤벨 애니메이션
    _controller2 = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation2 = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: -200, end: 300)
            .chain(CurveTween(curve: Curves.bounceOut)),
        weight: 100,
      ),
    ]).animate(_controller2);

    // 첫 번째 애니메이션 시작
    _controller1.forward();

    // 약간의 지연 후 두 번째 애니메이션 시작
    Future.delayed(Duration(milliseconds: 500), () {
      _controller2.forward();
    });

    // 3초 후 다음 화면으로 이동
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7F7), // 연한 분홍색 배경
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _animation2, // 오른쪽 덤벨
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(-10, _animation2.value), // 더 겹쳐지도록 조정
                  child: Transform.rotate(
                    angle: pi / 6, // 30도 오른쪽 회전
                    child: Image.asset(
                      'assets/dumbell.webp', // 덤벨 이미지 경로
                      width: 140,
                      height: 140,
                    ),
                  ),
                );
              },
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _animation1, // 왼쪽 덤벨
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(20, _animation1.value), // 더 겹쳐지도록 조정
                  child: Transform.rotate(
                    angle: -pi / 6, // 30도 왼쪽 회전
                    child: Image.asset(
                      'assets/dumbell.webp', // 덤벨 이미지 경로
                      width: 140,
                      height: 140,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
