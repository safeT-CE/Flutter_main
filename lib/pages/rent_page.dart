import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../main.dart';
import 'face_recognition_page.dart';
import 'number_input_page.dart';

class RentPage extends StatefulWidget {
  @override
  _RentPageState createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

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
            Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  backgroundColor: safeTgreen,
                  foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NumberInputPage(
                          onNumberEntered: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FaceRecognitionPage(
                                  onFaceRecognized: () {
                                    Navigator.pop(context); // 얼굴 인식 페이지 닫기
                                    _showBatteryPopup(context); // 배터리 팝업 표시
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Icon(Icons.dialpad),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: safeTgreen,
                    foregroundColor: Colors.white,

                  ),
                  onPressed: () {
                    if (controller != null) {
                      controller?.toggleFlash();
                    }
                  },
                  child: Icon(Icons.flashlight_on),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });

      if (result != null) {
        _navigateToFaceRecognition(context);
      }
    });
  }

  void _navigateToFaceRecognition(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FaceRecognitionPage(
          onFaceRecognized: () {
            Navigator.pop(context); // 얼굴 인식 페이지 닫기
            _showBatteryPopup(context); // 배터리 팝업 표시
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
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
              style: ElevatedButton.styleFrom(
                foregroundColor: safeTgreen,
              ),
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showRentalConfirmationPopup(context); // 대여 확인 팝업 표시
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: safeTgreen,
              ),
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
                Navigator.pushNamed(context, '/home'); // 홈으로 이동
              },
              style: ElevatedButton.styleFrom(
              foregroundColor: safeTgreen,
              ),
              child: Text('확인'),
            ),
          ],
        );
      }
    );
  }
}
