import 'package:flutter/material.dart';
import 'payment_page.dart';
import 'qr_scanner_page.dart';
import 'number_input_page.dart';
import 'identification_page.dart';

class RentPage extends StatefulWidget {
  @override
  _RentPageState createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {
  bool hasPaymentMethod = false; // 예시로 결제 수단 유무를 판단하는 플래그

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('대여하기'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // QR 인식 네모 칸
            Container(
              width: 200,
              height: 200,
              color: Colors.grey,
              child: Center(child: Text('QR 인식 칸')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NumberInputPage()),
                    );
                  },
                  child: Icon(Icons.dialpad),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  onPressed: () {
                    // 라이트 켜기 기능
                  },
                  child: Icon(Icons.flashlight_on),
                ),
              ],
            ),
            
            //qr인식 연결되면 지우기
            ElevatedButton(
              onPressed: () {
                if (!hasPaymentMethod) {
                  _showNoPaymentMethodPopup(context);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QrScannerPage()),
                  ).then((isIdentified) {
                    if (isIdentified != null && isIdentified) {
                      _showBatteryPopup(context);
                    }
                  });
                }
              },
              child: Text('QR 인식 시작'),
            ),
            //여기까지
            
          ],
        ),
      ),
    );
  }

  void _showNoPaymentMethodPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('결제 수단 없음'),
          content: Text('등록된 결제 수단이 없습니다. 결제 수단을 등록하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/payment');
              },
              child: Text('결제 수단 등록'),
            ),
          ],
        );
      },
    );
  }

  void _showBatteryPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('배터리 정보'),
          content: Text('배터리가 NN% 남은 기기입니다. 대여하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showRentalConfirmationPopup(context); // 대여 확인 팝업 표시
              },
              child: Text('대여하기'),
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
          title: Text('대여 완료'),
          content: Text('대여가 완료되었습니다.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
