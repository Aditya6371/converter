import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './length.dart';
import './temp.dart';
import './weight.dart';

void main() {
  runApp(
    const MyApp(),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      debugShowCheckedModeBanner: false,
      title: 'Converter',
      home: const Converter(),
    );
  }
}

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Converter"),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: const [
          TempConverter(),
          SizedBox(
            height: 50,
          ),
          LengthConverter(),
          SizedBox(
            height: 50,
          ),
          WeightConverter(),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
