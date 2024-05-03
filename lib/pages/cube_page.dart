import 'package:flutter/material.dart';

class CubePage extends StatefulWidget {
  @override
  _CubePageState createState() => _CubePageState();
}

class _CubePageState extends State<CubePage> {
  final TextEditingController _sisiController = TextEditingController();
  String _volume = '';
  String _keliling = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kubus Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/kubus.jpg',
                      height: 150,
                    ),
                    TextField(
                      controller: _sisiController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Panjang Sisi (s)',
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      child: Text('Hitung'),
                      onPressed: () {
                        if (_sisiController.text.isNotEmpty) {
                          int? sisi = int.tryParse(_sisiController.text);
                          if (sisi != null) {
                            _calculate();
                            showDialog(
                              context: context,
                              builder: (_) => _showDialog('Input Salah', 'Masukkan Angka terlebih dahulu'),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (_) => _showDialog('Input Salah', 'Masukkan Angka yang valid'),
                            );
                          }
                        } else {
                          showDialog(
                            context: context,
                            builder: (_) => _showDialog('Input Salah', 'Masukkan Panjang Sisi'),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Volume: $_volume',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Keliling: $_keliling',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _calculate() {
    double sisi = double.tryParse(_sisiController.text) ?? 0;

    double volume = sisi * sisi * sisi;
    double keliling = 12 * sisi;

    setState(() {
      _volume = volume.toStringAsFixed(2);
      _keliling = keliling.toStringAsFixed(2);
    });
  }

  Widget _showDialog(String title, String content) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
