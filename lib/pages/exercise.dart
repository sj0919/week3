import 'package:flutter/material.dart';
import 'package:week3/pages/PoseTrackerPage.dart';

class ExercisePage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  String name = "승진";
  bool isPastRoutine = true; // 토글 상태를 저장
  String selectedLevel = "중"; // 선택된 운동 강도
  List<String> selectedExercises = []; // 선택된 운동 리스트

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '운동',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "$name님, 오늘도 운동을 도전해볼까요?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildToggleButtons(),
              SizedBox(height: 20),
              isPastRoutine ? _buildPastRoutine() : _buildNewRoutine(), // 토글 상태에 따라 UI 변경
            ],
          ),
        ),
      ),
    );
  }

  // 토글 버튼 생성 함수
  Widget _buildToggleButtons() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFFFFF3F3), // 배경색
        borderRadius: BorderRadius.circular(24), // 둥근 테두리
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => isPastRoutine = true);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isPastRoutine ? Color(0xFFFFE0E0) : Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  "지난 루틴 불러오기",
                  style: TextStyle(
                    fontSize: 14,
                    color: isPastRoutine ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => isPastRoutine = false);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: !isPastRoutine ? Color(0xFFFFE0E0) : Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  "새 루틴 만들기",
                  style: TextStyle(
                    fontSize: 14,
                    color: !isPastRoutine ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 지난 루틴 불러오기 UI
  Widget _buildPastRoutine() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.thumb_up, color: Colors.green, size: 20),
                SizedBox(width: 8),
                Text(
                  "message : 주 3회 운동 완료! 앙뇽뇽!",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Icon(Icons.thumb_down, color: Colors.red, size: 20),
                SizedBox(width: 8),
                Text(
                  "message : 주 0일 운동... 왕심쿵..",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, index) {
            return _buildExerciseRecord();
          },
          separatorBuilder: (context, index) => Divider(color: Colors.grey[300]),
        ),
      ],
    );
  }

  // 새 루틴 만들기 UI
  Widget _buildNewRoutine() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.thumb_up, color: Colors.green, size: 20),
            SizedBox(width: 8),
            Text(
              "message : 주 3회 운동 완료! 앙뇽뇽!",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
        SizedBox(height: 2),
        Row(
          children: [
            Icon(Icons.thumb_down, color: Colors.red, size: 20),
            SizedBox(width: 8),
            Text(
              "message : 주 0일 운동... 왕심쿵..",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
        SizedBox(height: 30),
        Text(
          "추가할 운동 선택",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 12, // 버튼 간 간격 조정
          runSpacing: 12,
          children: [
            _buildStyledTag("pushup", Color(0xFFF08E)),
            _buildStyledTag("squat", Color(0xF7BBBB)),
            _buildStyledTag("lunge", Color(0xC5E09D)),
            _buildStyledTag("plank", Color(0xA6AEF7)),
          ],
        ),
        SizedBox(height: 20),
        Text(
          "선택한 운동: ${selectedExercises.join(', ')}",
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        SizedBox(height: 30),
        Text(
          "운동 강도 선택",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onVerticalDragUpdate: (details) {
            setState(() {
              if (details.delta.dy > 0) {
                if (selectedLevel == "상") {
                  selectedLevel = "중";
                } else if (selectedLevel == "중") {
                  selectedLevel = "하";
                }
              } else {
                if (selectedLevel == "하") {
                  selectedLevel = "중";
                } else if (selectedLevel == "중") {
                  selectedLevel = "상";
                }
              }
            });
          },
          child: Align(
            alignment: Alignment.center, // 가로 중앙 정렬
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildInteractiveLevelButton("상"),
                _buildInteractiveLevelButton("중"),
                _buildInteractiveLevelButton("하"),
              ],
            ),
          ),
        ),
        SizedBox(height: 50),
        Align(
          alignment: Alignment.center, // 버튼을 중앙에 배치
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecommendationPage(selectedExercises: selectedExercises, selectedLevel: selectedLevel)),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFFE0E0), // 버튼 배경색
              foregroundColor: Colors.black, // 텍스트 및 아이콘 색상
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24), // 버튼 모서리 둥글게
              ),
              minimumSize: Size(140, 40), // 버튼 크기
            ),
            child: Text(
              "루틴 생성",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildInteractiveLevelButton(String label) {
    final isSelected = selectedLevel == label;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: isSelected ? 200 : 120, // Reduced width for unselected buttons
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFFFE0E0) : Color(0xFFFFF3F3),
        borderRadius: BorderRadius.circular(8),
        boxShadow: isSelected
            ? [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ]
            : [],
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildTimeButton(String label) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFFFFF3F3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label),
    );
  }

  Widget _buildExerciseRecord() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          CircleAvatar(radius: 30),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("2024/12/31", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 2),
                Text("30분, 운동 강도: 상", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Row(
            children: [
              _buildTag("Cardio", Colors.orange),
              SizedBox(width: 5),
              _buildTag("Squat", Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label, style: TextStyle(color: color, fontSize: 12)),
    );
  }

  Widget _buildStyledTag(String label, Color color) {
    final isSelected = selectedExercises.contains(label);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedExercises.remove(label);
          } else {
            selectedExercises.add(label);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 3), // 패딩 추가
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.5) : color.withOpacity(0.2), // 선택 여부에 따른 배경색
          border: Border.all(color: color.withOpacity(1), width: 1.5), // 테두리 스타일
          borderRadius: BorderRadius.circular(16), // 모서리 둥글게
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black, // 텍스트 색상
            fontWeight: FontWeight.bold, // 텍스트 굵게
            fontSize: 14, // 텍스트 크기
          ),
        ),
      ),
    );
  }
}

// Update the RecommendationPage to handle dynamic recommendations
class RecommendationPage extends StatelessWidget {
  final List<String> selectedExercises;
  final String selectedLevel;

  RecommendationPage({required this.selectedExercises, required this.selectedLevel});

  Map<String, int> _calculateRecommendations(String level) {
    // Define base counts for each exercise based on difficulty
    final baseCounts = {
      'pushup': {'하': 10, '중': 20, '상': 30},
      'squat': {'하': 15, '중': 30, '상': 45},
      'lunge': {'하': 10, '중': 20, '상': 30},
      'plank': {'하': 20, '중': 40, '상': 60},
    };

    // Generate recommendations based on selected level
    Map<String, int> recommendations = {};
    for (var exercise in selectedExercises) {
      recommendations[exercise] = baseCounts[exercise]?[level] ?? 0;
    }
    return recommendations;
  }

  @override
  Widget build(BuildContext context) {
    final recommendations = _calculateRecommendations(selectedLevel);

    return Scaffold(
      appBar: AppBar(
        title: Text("운동 추천"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        automaticallyImplyLeading: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              "${selectedLevel} 강도로 ${selectedExercises.join(', ')} 추천",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: selectedExercises.map((exercise) {
                  return _buildExerciseTile(
                    imagePath: 'assets/${exercise.toLowerCase()}.png',
                    title: exercise,
                    count: exercise.toLowerCase() == 'plank'
                        ? '${recommendations[exercise]}분' // Display in minutes for plank
                        : '${recommendations[exercise]}회', // Display in repetitions for others
                    height: 100,
                    width: 100,
                  );
                }).toList(),

              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PoseTrackerPage(title: 'PoseTracker Demo')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFE0E0),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                minimumSize: Size(150, 40),
              ),
              child: Text(
                "운동 하러가기",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseTile({
    required String imagePath,
    required String title,
    required String count,
    required double height,
    required double width,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          count,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

