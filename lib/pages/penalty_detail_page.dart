import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart'; // Kakao Map 패키지 추가
import 'package:safet/pages/one_on_one_inquiry_page.dart';

import '../main.dart';
import 'violation_data.dart';

class PenaltyDetailPage extends StatelessWidget {
  final ViolationItem violation;

  const PenaltyDetailPage({super.key, required this.violation});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('벌점 상세'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4,
              color: safeTlightgreen,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 위반 제목과 닫기 버튼
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          violation.title,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(), // 구분선 추가
                    const SizedBox(height: 16),
                    
                    // 날짜 정보
                    Text(
                      '위반 날짜: ${violation.date}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    // 시간 정보
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          violation.time,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // 위치 정보
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          violation.location,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(), // 구분선 추가
                    const SizedBox(height: 16),

                    // 지도 표시
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        height: 200, // 지도 높이 설정
                        child: KakaoMap(
                          onMapCreated: (controller) {
                            // 필요시 mapController 저장
                          },
                          center: LatLng(
                              violation.latitude, violation.longitude),
                          markers: [
                            Marker(
                              markerId: UniqueKey().toString(),
                              latLng: LatLng(
                                  violation.latitude, violation.longitude),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    Divider(), // 구분선 추가
                    const SizedBox(height: 16),

                    // 이미지 표시
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        violation.imagePath,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Divider(), // 구분선 추가
                    const SizedBox(height: 16),

                    // 삭제 안내 문구
                    Text(
                      '본 기록은 30일 후 자동으로 삭제됩니다.\n기록 삭제와 동시에 알림도 전송됩니다.',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),

                    // 문의하기 버튼
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OneOnOneInquiryPage(
                              initialCategory: '벌점',
                              initialTitle: violation.title,
                              fromPenaltyDate: violation.date,
                              imagePath: violation.imagePath,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: safeTgreen,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 0,
                      ),
                      child: const Center(
                        child: Text(
                          '문의하기',
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
          ),
        ),
      ),
    );
  }
}
