import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:safet/main.dart';

class IdentificationPage extends StatefulWidget {
  @override
  _IdentificationPageState createState() => _IdentificationPageState();
}

class _IdentificationPageState extends State<IdentificationPage> {
  late CameraController _controller;
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    _controller = CameraController(frontCamera, ResolutionPreset.medium);
    await _controller.initialize();
    if (!mounted) return;
    setState(() {
      isCameraInitialized = true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('동일인 판별'),
      ),
      body: isCameraInitialized
          ? Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CameraPreview(_controller),
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.red, width: 2),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '얼굴을 영역 안에 맞추고\n촬영해 주세요.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            // 여기에서 동일인 판별 로직을 추가할 수 있습니다.
                            Navigator.pop(context, true); // 동일인 판별이 성공하면 true를 반환
                          },
                          child: Text('다음'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, 
                            backgroundColor: safeTgreen, // 텍스트 색상
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()), // 카메라 초기화 중에는 로딩 표시
    );
  }
}
