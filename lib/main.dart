import 'package:bbt_flutter_project/view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BBT Flutter API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyWidget()
    );
  }
}
