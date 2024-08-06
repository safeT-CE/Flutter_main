import 'package:flutter/material.dart';

import '../main.dart';
import 'faq_page.dart';
import 'one_on_one_inquiry_page.dart';
import 'personal_inquiry_page.dart';

class InquiryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('문의하기'),
          bottom: TabBar(
            tabs: [
              Tab(text: '자주하는 문의'),
              Tab(text: '개인 문의'),
            ],
          ),
        ),
        backgroundColor: safeTgreen,
        body: TabBarView(
          children: [
            FAQPage(),
            PersonalInquiryPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OneOnOneInquiryPage(
                  initialCategory: '기타',
                  initialTitle: '',
                ),
              ),
            );
          },
          backgroundColor: safeTgreen,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
