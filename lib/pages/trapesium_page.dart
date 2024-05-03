import 'package:flutter/material.dart';

class TrapesiumPage extends StatefulWidget {
  @override
  _TrapesiumPageState createState() => _TrapesiumPageState();
}

class _TrapesiumPageState extends State<TrapesiumPage> {
  final TextEditingController _sisiAtasController = TextEditingController();
  final TextEditingController _sisiBawahController = TextEditingController();
  final TextEditingController _sisiMiringController = TextEditingController();
  final TextEditingController _sisiTinggiController = TextEditingController();
  String _luas = '';
  String _keliling = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trapesium Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _sisiTinggiController.text.isEmpty ? 'd' : _sisiTinggiController.text,
                    ),
                    Column(
                      children: [
                        Text(
                          _sisiAtasController.text.isEmpty ? 'a' : _sisiAtasController.text,
                        ),
                        Image.asset(
                          'assets/images/Trapesium-Siku-Siku.jpg',
                          height: 150,
                        ),
                        Text(
                          _sisiBawahController.text.isEmpty ? 'b' : _sisiBawahController.text,
                        ),
                      ],
                    ),
                    Text(
                      _sisiMiringController.text.isEmpty ? 'c' : _sisiMiringController.text,
                    ),
                  ],
                ),
              ),
              TextField(
                controller: _sisiAtasController,
                onChanged: (_) => setState(() {}),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Panjang Basis Atas (a)',
                ),
              ),
              TextField(
                controller: _sisiBawahController,
                onChanged: (_) => setState(() {}),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Panjang Basis Bawah (b)',
                ),
              ),
              TextField(
                controller: _sisiMiringController,
                onChanged: (_) => setState(() {}),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Panjang Basis Miring (c)',
                ),
              ),
              TextField(
                controller: _sisiTinggiController,
                onChanged: (_) => setState(() {}),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Tinggi Trapesium (d)',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_sisiTinggiController.text.isNotEmpty && _sisiMiringController.text.isNotEmpty && _sisiAtasController.text.isNotEmpty && _sisiBawahController.text.isNotEmpty) {
                    int? sisi1 = int.tryParse(_sisiTinggiController.text);
                    int? sisi2 = int.tryParse(_sisiMiringController.text);
                    int? sisi3 = int.tryParse(_sisiAtasController.text);
                    int? sisi4 = int.tryParse(_sisiBawahController.text);
                    if (sisi1 != null && sisi2 != null && sisi3 != null && sisi4 != null) {
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
                child: Text('Hitung'),
              ),
              SizedBox(height: 20),
              Text(
                'Luas: $_luas',
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
      ),
    );
  }

  void _calculate() {
    double atas = double.tryParse(_sisiTinggiController.text) ?? 0;
    double bawah = double.tryParse(_sisiBawahController.text) ?? 0;
    double miring = double.tryParse(_sisiMiringController.text) ?? 0;
    double tinggi = double.tryParse(_sisiTinggiController.text) ?? 0;

    double luas = 0.5 * (atas + bawah) * tinggi;
    double keliling = atas + bawah + tinggi + miring;

    setState(() {
      _luas = luas.toStringAsFixed(2);
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
