import 'package:flutter/material.dart';

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
  int _currentIndex = 0; // 현재 선택된 탭 인덱스

  final List<Widget> _pages = [
    HomePageContent(), // 홈 화면 내용
    PlaceholderWidget(color: Colors.blue), // 차트 화면 (Placeholder)
    PlaceholderWidget(color: Colors.green), // 채팅 화면 (Placeholder)
    PlaceholderWidget(color: Colors.yellow), // 설정 화면 (Placeholder)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7F7), // 연한 분홍색 배경
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "000 님, 환영합니다.",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEAEAEA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                '전체 캘린더 보기',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
      body: _pages[_currentIndex], // 현재 인덱스에 해당하는 페이지 렌더링
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // 선택된 탭 인덱스 업데이트
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: '차트'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: '채팅'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 날짜 선택
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                7,
                    (index) => Column(
                  children: [
                    Text(
                      ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][index],
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: index == 6
                            ? Color(0xFFFFDCDC) // 선택된 날짜의 색상
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "${14 + index}",
                        style: TextStyle(
                          fontWeight: index == 6 ? FontWeight.bold : null,
                          color: index == 6 ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Divider(thickness: 1, color: Colors.grey[300]),
            SizedBox(height: 20),
            // 오늘의 혈당
            Text(
              "오늘의 혈당",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFFFFECEC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text("그래프를 여기에 표시 (플레이스홀더)"),
              ),
            ),
            SizedBox(height: 20),
            // 오늘의 리포트
            Text(
              "오늘의 리포트",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Stack(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: CircularProgressIndicator(
                            value: 0.95,
                            strokeWidth: 10,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "95점",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "혈당 점수: 95점\n사용 기기: Dex com 7",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            // 오늘의 레포트 상세
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildReportCard("공복혈당", "98"),
                _buildReportCard("식후혈당", "180"),
                _buildReportCard("평균혈당", "101"),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard(String title, String value) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: title == "식후혈당" ? Colors.red : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          'Placeholder',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
