import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'inquiry_data.dart';

class OneOnOneInquiryPage extends StatefulWidget {
  final String initialCategory;
  final String initialTitle;
  final String? fromPenaltyDate;
  final String? imagePath;

  const OneOnOneInquiryPage({
    super.key,
    required this.initialCategory,
    required this.initialTitle,
    this.fromPenaltyDate,
    this.imagePath,
  });

  @override
  _OneOnOneInquiryPageState createState() => _OneOnOneInquiryPageState();
}

class _OneOnOneInquiryPageState extends State<OneOnOneInquiryPage> {
  late String selectedCategory;
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.initialCategory;
    _titleController.text = widget.initialTitle;
  }

  void _submitInquiry() {
    final String title = _titleController.text;
    final String content = _contentController.text;

    if (selectedCategory.isNotEmpty && title.isNotEmpty && content.isNotEmpty) {
      Provider.of<InquiryData>(context, listen: false).addInquiry(
        selectedCategory,
        title,
        content,
        fromPenaltyDate: widget.fromPenaltyDate,
        imagePath: widget.imagePath,
      );

      _titleController.clear();
      _contentController.clear();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('문의가 제출되었습니다.'),
      ));

      Navigator.pop(context); // 문의 제출 후 개인 문의 페이지로 이동
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
        title: const Text('문의하기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: '문의 분류'),
              items: ['기타', '결제', '벌점', '회원정보'].map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
              value: selectedCategory,
            ),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: '제목을 입력해주세요'),
            ),
            TextFormField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: '내용을 입력해주세요'),
              maxLines: 5,
              maxLength: 200,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitInquiry,
              child: const Text('1:1 문의하기'),
            ),
          ],
        ),
      ),
    );
  }
}
