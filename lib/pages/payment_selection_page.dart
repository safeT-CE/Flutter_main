import 'package:flutter/material.dart';

class PaymentSelectionPage extends StatefulWidget {
  const PaymentSelectionPage({Key? key}) : super(key: key);

  @override
  _PaymentSelectionPageState createState() => _PaymentSelectionPageState();
}

class _PaymentSelectionPageState extends State<PaymentSelectionPage> {
  static const String kakaoPay = 'Kakao Pay';
  static const String naverPay = 'Naver Pay';

  String _selectedPaymentMethod = kakaoPay; // 초기값 설정

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결제 수단 선택'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: const Text(kakaoPay),
              leading: Radio<String>(
                value: kakaoPay,
                groupValue: _selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text(naverPay),
              leading: Radio<String>(
                value: naverPay,
                groupValue: _selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 결제 수단 등록 로직 추가
                _showRentalConfirmationPopup(context);
              },
              child: const Text('등록'),
            ),
          ],
        ),
      ),
    );
  }

  void _showRentalConfirmationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('등록 완료'),
          content: const Text('등록이 완료되었습니다.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
