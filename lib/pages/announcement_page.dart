import 'package:flutter/material.dart';
import 'package:safet/main.dart';

class AnnouncementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: safeTgreen),
        title: Text(
          '공지사항',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: AnnouncementList(),
    );
  }
}

class AnnouncementList extends StatefulWidget {
  @override
  _AnnouncementListState createState() => _AnnouncementListState();
}

class _AnnouncementListState extends State<AnnouncementList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AnnouncementTile(
          title: '2024년 이용권 업그레이드 안내',
          date: '2024.07.01',
          content: '2024년부터 새로운 이용권 업그레이드가 진행됩니다.',
        ),
        AnnouncementTile(
          title: '벌점 안내 : 제한 범위',
          date: '2024.06.12',
          content: '벌점 제한 범위에 대한 자세한 안내입니다.',
        ),
        AnnouncementTile(
          title: '변경된 이용 방법 공지',
          date: '2024.05.10',
          content: '이용 방법이 일부 변경되었습니다.',
        ),
        AnnouncementTile(
          title: '데이터 삭제 안내',
          date: '2024.02.20',
          content: '데이터 삭제에 대한 안내입니다.',
        ),
        AnnouncementTile(
          title: '벌점 안내 : 제한 범위',
          date: '2024.01.30',
          content: '벌점 제한 범위에 대한 반복 안내입니다.',
        ),
        AnnouncementTile(
          title: 'OO 대여소 폐쇄 안내',
          date: '2024.01.10',
          content:
              'Lorem ipsum dolor sit amet consectetur. Sapien at sapien tincidunt amet libero viverra arcu elit. Habitant habitant sollicitudin tempor imperdiet pharetra dignissim dignissim lobortis.',
        ),
        AnnouncementTile(
          title: '크리스마스 이벤트',
          date: '2023.12.25',
          content: '크리스마스 이벤트가 준비되어 있습니다.',
        ),
        AnnouncementTile(
          title: '결제 방법',
          date: '2023.12.24',
          content: '결제 방법에 대한 자세한 안내입니다.',
        ),
      ],
    );
  }
}

class AnnouncementTile extends StatelessWidget {
  final String title;
  final String date;
  final String content;

  AnnouncementTile({
    required this.title,
    required this.date,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          color: safeTblack, // title 색상을 safeTblack으로 변경
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        date,
        style: TextStyle(color: safeTgray), // date 색상을 safeTgray으로 변경
      ),
      iconColor: safeTlightgreen, // 화살표 아이콘 색상 safeTlightgreen으로 변경
      collapsedIconColor: safeTlightgreen, // 펼쳐지기 전 아이콘 색상도 safeTlightgreen으로 설정
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(content),
        ),
      ],
      // 경계선 색상을 safeTlightgreen으로 변경
      shape: Border(
        top: BorderSide(color: Colors.white),
        bottom: BorderSide(color: safeTlightgreen),
      ),
      collapsedShape: Border(
        top: BorderSide(color: Colors.white),
        bottom: BorderSide(color: safeTlightgreen),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AnnouncementPage(),
  ));
}
