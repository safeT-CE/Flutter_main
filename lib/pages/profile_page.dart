import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safet/pages/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/auth_helper.dart';
import 'announcement_page.dart';
import 'ask_page.dart';
import 'login_page.dart';
import 'payment_selection_page.dart';
import 'penalty_point_page.dart';
import 'ticket_purchase_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String phoneNumber = '010-1234-5678';
  bool isEditingPhoneNumber = false;

  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      phoneNumber = prefs.getString('phoneNumber') ?? '010-1234-5678';
      _phoneNumberController.text = phoneNumber;
    });
  }

  void _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('phoneNumber', phoneNumber);
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _toggleEditingPhoneNumber() {
    setState(() {
      isEditingPhoneNumber = !isEditingPhoneNumber;
    });
  }

  void _savePhoneNumber() {
    setState(() {
      phoneNumber = _phoneNumberController.text;
      isEditingPhoneNumber = false;
      _saveSettings();
    });
  }

  void _showLogoutPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('로그아웃 하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () async {
                await AuthHelper.setLoginStatus(false);
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text('로그아웃'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('프로필'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.lightGreen[100],
                child: Column(
                  children: [
                    Row(
                      children: [
                        if (isEditingPhoneNumber)
                          Expanded(
                            child: TextField(
                              controller: _phoneNumberController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                hintText: '000-0000-0000',
                              ),
                            ),
                          )
                        else
                          Text(
                            '$phoneNumber 님',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        IconButton(
                          icon: Icon(isEditingPhoneNumber ? Icons.save : Icons.edit),
                          onPressed: isEditingPhoneNumber ? _savePhoneNumber : _toggleEditingPhoneNumber,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset('assets/image/seed.png', width: 50, height: 50),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'LV 5 \n 이용시간: \n 누적 이동 거리: \n',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              SwitchListTile(
                title: const Text('다크모드'),
                value: themeProvider.isDarkMode,
                onChanged: (bool value) {
                  themeProvider.toggleTheme(value);
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('공지사항'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnnouncementPage()),
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('벌점 기록'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PenaltyPointPage()),
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('카드 등록'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PaymentSelectionPage()),
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('문의하기'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AskPage()),
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('이용권 구매'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TicketPurchasePage()),
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('로그아웃'),
                onTap: () {
                  _showLogoutPopup(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
