import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class FaceRecognitionPage extends StatefulWidget {
  final VoidCallback onFaceRecognized;

  FaceRecognitionPage({required this.onFaceRecognized});

  @override
  _FaceRecognitionPageState createState() => _FaceRecognitionPageState();
}

class _FaceRecognitionPageState extends State<FaceRecognitionPage> {
  late CameraController _controller;
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
      // 전면 카메라 선택
      CameraDescription frontCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front);
      _controller = CameraController(frontCamera, ResolutionPreset.medium);
      _controller.initialize().then((_) {
        if (!mounted) return;
        setState(() {
          isCameraInitialized = true;
        });
      });
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
      appBar: AppBar(title: Text('얼굴 인식')),
      body: isCameraInitialized
          ? Column(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: CameraPreview(_controller),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onFaceRecognized();
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: safeTgreen,
                      foregroundColor: Colors.white,
                        ),

                      child: Text('인식 완료'),
                    ),
                  ),
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()), // 카메라 초기화 중에는 로딩 표시
    );
  }
}
