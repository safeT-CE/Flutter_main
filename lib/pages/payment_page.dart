import 'package:flutter/material.dart';
import 'qr_scanner_page.dart'; // QR Scanner 페이지 임포트

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  static const String kakaoPay = 'Kakao Pay';
  static const String naverPay = 'Naver Pay';
  
  String _selectedPaymentMethod = kakaoPay; // 초기값 설정

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결제 수단 등록'),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QrScannerPage(),
                  ),
                ).then((isIdentified) {
                  if (isIdentified != null && isIdentified) {
                    _showBatteryPopup(context);
                  }
                });
              },
              child: const Text('등록'),
            ),
          ],
        ),
      ),
    );
  }

  void _showBatteryPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('배터리 정보'),
          content: const Text('배터리가 NN% 남은 기기입니다. 대여하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showRentalConfirmationPopup(context); // 대여 확인 팝업 표시
              },
              child: const Text('대여하기'),
            ),
          ],
        );
      },
    );
  }

  void _showRentalConfirmationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('대여 완료'),
          content: const Text('대여가 완료되었습니다.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
