import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

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
                  child: CameraPreview(_controller),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '계정 소유자와 동일인인지 판별하는 과정입니다.\n얼굴을 원 안에 넣어 주세요.',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            // 여기에서 동일인 판별 로직을 추가할 수 있습니다.
                            Navigator.pop(context, true); // 동일인 판별이 성공하면 true를 반환
                          },
                          child: Text('다음'),
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
