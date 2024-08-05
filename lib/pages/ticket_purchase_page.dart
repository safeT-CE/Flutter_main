import 'package:flutter/material.dart';

class TicketPurchasePage extends StatefulWidget {
  const TicketPurchasePage({super.key});

  @override
  _TicketPurchasePageState createState() => _TicketPurchasePageState();
}

class _TicketPurchasePageState extends State<TicketPurchasePage> {
  String _selectedDuration = '30분';
  int _paymentAmount = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이용권 구매'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('대여시간', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _buildDurationButton('30분', 1000),
                _buildDurationButton('1시간', 2000),
                _buildDurationButton('2시간', 3000),
                _buildDurationButton('3시간', 4000),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('결제금액', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('$_paymentAmount원', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text(_selectedDuration, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showPaymentConfirmationPopup(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text('결제하기', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDurationButton(String duration, int amount) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedDuration = duration;
          _paymentAmount = amount;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedDuration == duration ? Colors.lightGreen : Colors.white,
        foregroundColor: _selectedDuration == duration ? Colors.white : Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      ),
      child: Text(duration),
    );
  }

  void _showPaymentConfirmationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('결제 완료'),
          content: const Text('결제가 완료되었습니다.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
