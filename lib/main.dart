import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CountALetter(),
    );
  }
}

class CountALetter extends StatefulWidget {
  @override
  _CountALetterState createState() => _CountALetterState();
}

class _CountALetterState extends State<CountALetter> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void countALetters() {
    String input = _controller.text.toLowerCase();
    int count = input.runes.where((r) => r == 'a'.runes.first).length;

    setState(() {
      _result = "A letra 'a' aparece $count vezes.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true, // Centraliza o título
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            "contém quantos 'A ?'",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite uma frase",
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: countALetters,
              child: Text("Contar"),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
