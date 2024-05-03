import 'package:flutter/material.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({Key? key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hari Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Masukkan Nomor Hari:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _inputController,
                decoration: InputDecoration(
                  labelText: 'Nomor Hari (1-7)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                maxLength: 1,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int? selectedDay = int.tryParse(_inputController.text);
                if (selectedDay != null && selectedDay >= 1 && selectedDay <= 7) {
                  Navigator.pushNamed(context, '/dayCalculated',  arguments: selectedDay);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Input Salah'),
                        content: Text('Masukkan nomor hari dari 1 hingga 7.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Check'),
            ),
          ],
        ),
      ),
    );
  }
}

class DayCalculatorPage extends StatelessWidget {
  final int selectedDay;

  DayCalculatorPage({required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    String dayName = '';

    switch (selectedDay) {
      case 1:
        dayName = 'Senin';
        break;
      case 2:
        dayName = 'Selasa';
        break;
      case 3:
        dayName = 'Rabu';
        break;
      case 4:
        dayName = 'Kamis';
        break;
      case 5:
        dayName = 'Jumat';
        break;
      case 6:
        dayName = 'Sabtu';
        break;
      case 7:
        dayName = 'Minggu';
        break;
      default:
        dayName = 'Invalid';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Hari Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hari ke-$selectedDay adalah $dayName',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
