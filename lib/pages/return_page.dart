import 'package:flutter/material.dart';

class ReturnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('반납하기'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showReturnPopup(context);
          },
          child: Text('반납하기'),
        ),
      ),
    );
  }

  void _showReturnPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('반납하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 팝업 닫기
              },
              child: Text('뒤로가기'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 팝업 닫기
                _showReturnConfirmationPopup(context); // 반납 완료 팝업 표시
              },
              child: Text('반납하기'),
            ),
          ],
        );
      },
    );
  }

  void _showReturnConfirmationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('반납 완료'),
          content: Text('반납이 완료되었습니다.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/home'); // 홈으로 이동
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
