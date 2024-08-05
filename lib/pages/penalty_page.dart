import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'penalty_detail_page.dart';
import 'violation_data.dart';

class PenaltyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final violationData = Provider.of<ViolationData>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('벌점 기록'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '벌점 내역',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: violationData.violations.length,
                itemBuilder: (context, index) {
                  final violation = violationData.violations[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(
                        violation.imagePath,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(violation.title),
                      subtitle: Text(violation.date),
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
    );
  }
}
