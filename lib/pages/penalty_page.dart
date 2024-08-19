import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safet/main.dart';

import 'penalty_detail_page.dart';
import 'violation_data.dart';

class PenaltyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final violationData = Provider.of<ViolationData>(context);
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('벌점 기록'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: violationData.violations.length,
                  itemBuilder: (context, index) {
                    final violation = violationData.violations[index];
                    return Card(
                      color: safeTlightgreen, // Card 배경색을 흰색으로 설정
                      child: ListTile(
                        leading: Image.asset(
                          violation.imagePath,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(violation.title,
                        style: TextStyle(
                                fontSize: 15,
                                color: Colors.red,
                              ),),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  violation.date,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '누적 ${violation.count}회',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PenaltyDetailPage(violation: violation),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
