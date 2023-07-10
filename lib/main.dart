import 'package:flutter/material.dart';
import 'package:tracked/screens/auth/signup.dart';
import 'package:tracked/screens/doclist.dart';
import 'package:tracked/utils/locator_setup.dart';

Future<void> main() async{

  await locatorSetup();
  runApp(const Tracked());
}

class Tracked extends StatefulWidget {
  const Tracked({super.key});

  @override
  State<Tracked> createState() => _TrackedState();
}

class _TrackedState extends State<Tracked> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tracked',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home:  SignUp(),
    );
  }
}



