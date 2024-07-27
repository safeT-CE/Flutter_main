import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'inquiry_data.dart';

class OneOnOneInquiryPage extends StatefulWidget {
  @override
  _OneOnOneInquiryPageState createState() => _OneOnOneInquiryPageState();
}

class _OneOnOneInquiryPageState extends State<OneOnOneInquiryPage> {
  final List<String> categories = ['기타', '결제', '벌점', '회원정보'];
  String? selectedCategory;
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _submitInquiry() {
    final String title = _titleController.text;
    final String content = _contentController.text;
    final String? category = selectedCategory;

    if (category != null && title.isNotEmpty && content.isNotEmpty) {
      Provider.of<InquiryData>(context, listen: false).addInquiry(category, title, content);

      _titleController.clear();
      _contentController.clear();
      setState(() {
        selectedCategory = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('문의가 제출되었습니다.'),
      ));

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('모든 필드를 입력해주세요.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('문의하기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: '문의 분류'),
              items: categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
              value: selectedCategory,
            ),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: '제목을 입력해주세요'),
            ),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(labelText: '내용을 입력해주세요'),
              maxLines: 5,
              maxLength: 200,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitInquiry,
              child: Text('1:1 문의하기'),
            ),
          ],
        ),
      ),
    );
  }
}
