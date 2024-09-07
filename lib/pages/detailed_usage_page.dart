import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safet/main.dart';

import 'detailed_usage_data.dart';
import 'detailed_usage_map_page.dart';

class DetailedUsagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final detailedUsageData = Provider.of<DetailedUsageData>(context);
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('상세 이용 정보'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,

        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: detailedUsageData.usages.length,
                  itemBuilder: (context, index) {
                    final usage = detailedUsageData.usages[index];
                    return Card(
                      color: safeTlightgreen,  // 카드의 배경색
                      child: ListTile(
                        leading: Image.asset(
                          usage.imagePath,  // 이미지 경로
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                          title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              usage.date,
                              style: TextStyle(
                                fontSize: 15, 
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  usage.driveTime,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '${usage.driveDistance} km',
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
                              builder: (context) => DetailedUsageMapPage(usage: usage),
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