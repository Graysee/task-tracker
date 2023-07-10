import 'package:flutter/material.dart';
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

  int _currentIndex = 0;
  List<Widget> _screens = [UserScreen(), TodoScreen()];

  onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tracked',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Todos',
            ),
          ],
          selectedItemColor: Colors.blue,
          currentIndex: _currentIndex,
        ),
      ),
    );
  }
}



