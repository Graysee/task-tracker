import 'package:flutter/material.dart';
import 'package:tracked/screens/doclist.dart';

void main() {
  runApp(const Tracked());
}

class Tracked extends StatelessWidget {
  const Tracked({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tracked',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // home:  DocList(),
    );
  }
}



