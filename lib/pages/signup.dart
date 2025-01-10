import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  void _signUp(BuildContext context) {
    String name = _nameController.text;
    String id = _idController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;
    String height = _heightController.text;
    String weight = _weightController.text;

    // 필수 입력값 검증
    if (name.isEmpty ||
        id.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        height.isEmpty ||
        weight.isEmpty) {
      _showMessage(context, '모든 필드를 입력해주세요.');
      return;
    }

    // 비밀번호 확인
    if (password != confirmPassword) {
      _showMessage(context, '비밀번호가 일치하지 않습니다.');
      return;
    }

    // 회원가입 성공 메시지
    _showMessage(context, '회원가입이 완료되었습니다!');
    print('회원가입 성공: $name, $id, $height, $weight');
  }

  void _showMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('확인'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7F7), // 연한 분홍색 배경
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '회원가입',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // 뒤로 가기
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('이름', _nameController),
              SizedBox(height: 14),
              _buildTextField('아이디', _idController),
              SizedBox(height: 14),
              _buildTextField('비밀번호', _passwordController, obscureText: true),
              SizedBox(height: 14),
              _buildTextField('비밀번호 확인', _confirmPasswordController,
                  obscureText: true),
              SizedBox(height: 14),
              _buildTextField('키 (cm)', _heightController),
              SizedBox(height: 14),
              _buildTextField('몸무게 (kg)', _weightController),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () => _signUp(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFDCDC), // 분홍색 버튼 배경
                    minimumSize: Size(double.infinity, 40), // 버튼 크기 (높이 약간 줄임)
                    padding: EdgeInsets.symmetric(horizontal: 25.0), // 버튼 패딩 추가
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    '가입완료',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller,
      {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0), // 왼쪽 여백 추가
          child: Text(
            hint,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 50, // 입력 필드 전체 높이
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 14, vertical: 8),
              // 텍스트 내부 여백
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey[350], // 힌트 텍스트를 회색으로 설정
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
