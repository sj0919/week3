import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name="승진";
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final weekDays = List.generate(7, (index) {
      final day = _focusedDay.subtract(Duration(days: _focusedDay.weekday - 1 - index));
      return day;
    });

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "HOME",
          style: TextStyle(color: Colors.black,fontSize:17),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name님, 환영합니다",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              // Custom Weekly Calendar
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: weekDays.map((day) {
                    final isSelected = isSameDay(day, _selectedDay);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDay = day;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            DateFormat.E().format(day), // Weekday (Mon, Tue, ...)
                            style: TextStyle(
                              fontSize: 14,
                              color: isSelected ? Colors.red : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: isSelected ? Color(0xFFFFECEC) : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              DateFormat.d().format(day), // Day (14, 15, ...)
                              style: TextStyle(
                                fontSize: 14,
                                color: isSelected ? Colors.red : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "오늘의 혈당",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 20),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xFFFFECEC),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text("그래프")),
              ),
              SizedBox(height: 20),
              Text(
                "오늘의 리포트",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "혈당 점수:95점",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // 그림자가 있는 배경
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white, // 원형 배경색
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3), // 부드러운 그림자
                            blurRadius: 15, // 그림자 흐림 정도
                            offset: Offset(0, 8), // 그림자 위치
                          ),
                        ],
                      ),
                    ),
                    // CircularProgressIndicator
                    Transform.scale(
                      scale: 3.0, // CircularProgressIndicator 크기 조정
                      child: CircularProgressIndicator(
                        value: 0.95, // 진행 상태
                        color: Color(0xFFB9E7C5), // 진행 색상
                        strokeWidth: 10, // 테두리 두께
                        backgroundColor: Colors.white, // 배경색
                      ),
                    ),
                    // 텍스트
                    Text(
                      "95점",
                      style: TextStyle(
                        fontSize: 24, // 텍스트 크기
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text("오늘의 리포트", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text("사용기기:Dex com 7", style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildReportCard("공복혈당", "98", Colors.green),
                  _buildReportCard("식후혈당", "180", Colors.red),
                  _buildReportCard("평균혈당", "101", Colors.orange),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReportCard(String title, String value, Color color) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(value, style: TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  bool isSameDay(DateTime day1, DateTime day2) {
    return day1.year == day2.year && day1.month == day2.month && day1.day == day2.day;
  }
}
