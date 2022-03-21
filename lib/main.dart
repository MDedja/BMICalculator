import 'package:flutter/material.dart';
import 'package:domaci4/drugi_widget.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;
  double _bmi = 0;
  TextEditingController _visinaKontroler = TextEditingController();
  TextEditingController _tezinaKontroler = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  sledecaStranica(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DrugiWidget()),
    );
  }

  izracunaj(context) {
    double tezina = double.parse(_tezinaKontroler.text);
    double visina = double.parse(_visinaKontroler.text);

    setState(() {
      _bmi = (tezina / (visina * visina)) * 10000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("BMI Kalkulator"),
            backgroundColor: Colors.grey.shade600,
            actions: [
              InkWell(
                child: const Icon(Icons.line_weight),
                onTap: () {
                  sledecaStranica(context);
                },
              )
            ],
          ),
          body: Card(
            child: Column(
              children: [
                const Text("Kilograma:"),
                TextField(
                  controller: _tezinaKontroler,
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Color.alphaBlend(Colors.black, Colors.black)),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Kilograma",
                    hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.withOpacity(.8)),
                  ),
                ),
                const Text("Visina:"),
                TextField(
                  controller: _visinaKontroler,
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Color.alphaBlend(Colors.black, Colors.black)),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Visina",
                    hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.withOpacity(.8)),
                  ),
                ),
                const SizedBox(height: 30),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    izracunaj(context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(_bmi.toString()),
                        );
                      },
                    );
                  },
                  child: const Text('Izracunaj'),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              sledecaStranica(context);
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.navigation),
          )),
    );
  }
}
