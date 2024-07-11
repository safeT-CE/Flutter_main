import 'package:flutter/material.dart';
import 'auth_phonenum_verificate_page.dart';
import 'package:safet/main.dart';

class PhoneNumberInputPage extends StatefulWidget {
  @override
  _PhoneNumberInputPageState createState() => _PhoneNumberInputPageState();
}

class _PhoneNumberInputPageState extends State<PhoneNumberInputPage> {
  final TextEditingController _phoneController = TextEditingController();

  void _navigateToVerificationPage() {
    if (_phoneController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhoneVerificationPage(
            phoneNumber: _phoneController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('휴대폰 번호를 입력해주세요.'),
        centerTitle: true,
        automaticallyImplyLeading: false, // 뒤로 가기 버튼 제거
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('휴대폰 번호'),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixText: '+82 ',
                hintText: '00-0000-0000',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _navigateToVerificationPage,
              style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('확인'),
            ),
          ],
        ),
      ),
    );
  }
}
