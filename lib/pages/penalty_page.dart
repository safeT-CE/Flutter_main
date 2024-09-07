import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart'; // Kakao Map 패키지 추가
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
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: violationData.violations.length,
                  itemBuilder: (context, index) {
                    final violation = violationData.violations[index];
                    return Card(
                      color: safeTlightgreen,
                      child: InkWell(
                        onTap: () {
                          // 카드 전체 또는 "확인하기" 버튼 클릭 시 벌점 상세 페이지로 이동
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PenaltyDetailPage(violation: violation),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    violation.title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '누적 ${violation.count}회',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                violation.date,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                height: 200, // 지도 높이를 200으로 설정
                                child: KakaoMap(
                                  onMapCreated: (controller) {
                                    // 올바른 방법으로 Marker 생성 및 추가
                                    controller.addMarker(
                                      /*
                                      Marker(
                                        markerId: 'violation_marker_$index',
                                        latLng: LatLng(
                                          violation.latitude,
                                          violation.longitude,
                                        ),
                                      ),*/
                                    );
                                  },
                                  center: LatLng(
                                    violation.latitude,
                                    violation.longitude,
                                  ),
                                  maxLevel: 16, // 줌 레벨 설정
                                ),
                              ),
                              SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // "확인하기" 버튼 클릭 시 벌점 상세 페이지로 이동
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PenaltyDetailPage(
                                        violation: violation,
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: safeTgreen,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(8.0),
                                  ),
                                  elevation: 0,
                                ),
                                child: Center(
                                  child: Text(
                                    '확인하기',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
