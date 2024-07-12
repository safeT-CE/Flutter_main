import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:safet/pages/auth_idinfo_check_page.dart';

class IdCamPage extends StatefulWidget {
  final CameraDescription camera;

  IdCamPage({required this.camera});

  @override
  _IdCamPageState createState() => _IdCamPageState();
}

class _IdCamPageState extends State<IdCamPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final textDetector = GoogleMlKit.vision.textDetector();
  List<String> _recognizedLines = [];

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    textDetector.close();
    super.dispose();
  }

  Future<void> _processImage() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      final inputImage = InputImage.fromFilePath(image.path);
      final RecognisedText recognisedText = await textDetector.processImage(inputImage);

      List<String> recognizedLines = [];

      for (TextBlock block in recognisedText.blocks) {
        for (TextLine line in block.lines) {
          final text = line.text.trim();
          recognizedLines.add(text);
        }
      }

      setState(() {
        _recognizedLines = recognizedLines;
      });

      if (_recognizedLines.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IdInfoCheckPage(recognizedLines: _recognizedLines),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('텍스트를 인식하지 못했습니다. 다시 시도해주세요.')),
        );
      }

    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('오류가 발생했습니다. 다시 시도해주세요.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                IconButton(
                  icon: Icon(Icons.close, color: Colors.grey),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  '신분증을 영역 안에 맞추고\n촬영해 주세요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 30),
                Container(
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2),
                  ),
                  child: ListView.builder(
                    itemCount: _recognizedLines.length,
                    itemBuilder: (context, index) {
                      return Text(
                        _recognizedLines[index],
                        style: TextStyle(color: Colors.white),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 150,
            left: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.all(16),
              color: Color(0xFFFFE4E1),
              child: Row(
                children: [
                  Icon(Icons.lightbulb_outline, color: Colors.yellow),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '신분증에 빛이 반사되지 않도록 영역안에\n조절하여 주세요.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 16,
            right: 16,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _processImage,
              child: Text(
                '다음',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
