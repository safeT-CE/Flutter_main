import 'package:flutter/material.dart';

class AgreementPage extends StatefulWidget {
  @override
  _AgreementPageState createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  bool _allAgree = false;
  List<bool> _agreeList = List<bool>.generate(7, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('약관에 동의해 주세요.'),
        centerTitle: true,//title 중앙정렬
        automaticallyImplyLeading: false, //뒤로 가기 버튼 제거
        actions:[
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
            CheckboxListTile(
              title: Text('약관 전체 동의'),
              value: _allAgree,
              onChanged: (bool? value) {
                setState(() {
                  _allAgree = value!;
                  for (int i = 0; i < _agreeList.length; i++) {
                    _agreeList[i] = _allAgree;
                  }
                });
              },
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: _agreeList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    title: Text('(필수) 약관 항목 ${index + 1}'),
                    value: _agreeList[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _agreeList[index] = value!;
                        _allAgree = _agreeList.every((bool agree) => agree);
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _agreeList.every((bool agree) => agree)
                  ? () {
                      // 다음 페이지로 이동 또는 약관 동의 처리
                      Navigator.pushNamed(context, '/auth_number');

                    }
                  : null,
              style: ElevatedButton.styleFrom(
                primary: Colors.lightGreen,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('동의하고 진행'),
            ),
          ],
        ),
      ),
    );
  }
}
