import 'package:flutter/material.dart';

import '../main.dart';

class ReturnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('반납하기'),
          backgroundColor: Colors.white, 
          foregroundColor: Colors.black,
        ),
      body: Container(
        color: safeTlightgreen, 
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _showReturnPopup(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: safeTgreen,
              foregroundColor: Colors.white,
            ),
              child: Text('반납하기'),
            ),
          ),
        ),
      )
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
              style: TextButton.styleFrom(
                foregroundColor: safeTgreen, // 버튼 글씨 색상 지정
              ),
              child: Text('뒤로가기'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 팝업 닫기
                _showReturnConfirmationPopup(context); // 반납 완료 팝업 표시
              },
              style: TextButton.styleFrom(
                foregroundColor: safeTgreen, // 버튼 글씨 색상 지정
              ),
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
              style: TextButton.styleFrom(
                foregroundColor: safeTgreen, // 버튼 글씨 색상 지정
              ),
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
