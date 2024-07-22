import 'package:flutter/material.dart';
import 'package:safet/main.dart';

class IdInfoCheckPage extends StatefulWidget {
  final List<String> recognizedLines;
  final String? dateOfIssue;
  final String? dateOfBirth;
  final String? licenseNumber;

  IdInfoCheckPage({
    required this.recognizedLines,
    this.dateOfIssue,
    this.dateOfBirth,
    this.licenseNumber,
  });

  @override
  _IdInfoCheckPageState createState() => _IdInfoCheckPageState();
}

class _IdInfoCheckPageState extends State<IdInfoCheckPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateOfIssueController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _licenseNumberController = TextEditingController();
  String? _selectedLicenseType;
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _dateOfIssueFocusNode = FocusNode();
  final FocusNode _dateOfBirthFocusNode = FocusNode();
  final FocusNode _licenseNumberFocusNode = FocusNode();
  final FocusNode _licenseTypeFocusNode = FocusNode();
  
  @override
  void initState() {
    super.initState();
    _dateOfIssueController.text = widget.dateOfIssue ?? '2024.04.19';
    _dateOfBirthController.text = widget.dateOfBirth ?? '010130';
    _licenseNumberController.text = widget.licenseNumber ?? '00-11-222222-33';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateOfIssueController.dispose();
    _dateOfBirthController.dispose();
    _licenseNumberController.dispose();
    _nameFocusNode.dispose();
    _dateOfIssueFocusNode.dispose();
    _dateOfBirthFocusNode.dispose();
    _licenseNumberFocusNode.dispose();
    _licenseTypeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: safeTgray),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Align children to stretch
          children: [
            Text(
              '인식된 신분증 정보를 확인해주세요.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30), // Adjust height to your preference
            _buildInfoRow('이름', _nameController, _nameFocusNode, '이름을 입력하세요'),
            SizedBox(height: 10),
            _buildDropdownRow(
              label: '면허종류',
              items: [
                '2종 보통',
                '1종 보통',
                '2종 원동기 장치 자전거'
              ],
              value: _selectedLicenseType,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLicenseType = newValue;
                });
              },
              focusNode: _licenseTypeFocusNode,
              hintText: '면허종류를 선택해주세요',
            ),
            SizedBox(height: 10),
            _buildInfoRow('발급일', _dateOfIssueController, _dateOfIssueFocusNode, '2024.04.19'),
            SizedBox(height: 10),
            _buildInfoRow('생년월일', _dateOfBirthController, _dateOfBirthFocusNode, '010130'),
            SizedBox(height: 10),
            _buildInfoRow('운전면허 번호', _licenseNumberController, _licenseNumberFocusNode, '00-11-222222-33'),
            Spacer(), // Spacer to push the button to the bottom
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: safeTgreen,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/auth_face_how');
              },
              child: Text(
                '다음',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hintText,
  }) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: safeTgreen),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: safeTlightgreen),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0), 
      ),
    );
  }

  Widget _buildInfoRow(String label, TextEditingController controller, FocusNode focusNode, String hintText) {
    return Row(
      children: [
        Expanded(
          child: _buildTextField(
            controller: controller,
            focusNode: focusNode,
            label: label,
            hintText: hintText,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownRow({
    required String label,
    required List<String> items,
    required String? value,
    required void Function(String?) onChanged,
    required FocusNode focusNode,
    required String hintText,
  }) {
    return Row(
      children: [
        Expanded(
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: label,
              hintText: hintText,
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: safeTgreen),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: safeTlightgreen),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0), // Adjust height
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: onChanged,
                hint: Text(hintText),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
