import 'package:flutter/material.dart';

void pushReplacementNav(BuildContext context, Widget route){
  Navigator.pushReplacement(context, MaterialPageRoute(fullscreenDialog:false,builder: (BuildContext context)=>route,));
} //pushes the second page on the original page while popping the previous or first page

void pushNavigator(BuildContext context, Widget route){
  Navigator.push(context, MaterialPageRoute(fullscreenDialog:false, builder: (BuildContext context)=>route));
} //this pushes or stacks another screen above the previous screen.

void pushNamedNav(BuildContext context, String route){
  Navigator.pushNamed(context, route);
} //this pushes another screen on the initial one using the name of the screen

void pushNamedReplacement(BuildContext context, String route){
  Navigator.pushReplacementNamed(context, route);
}

void pushAAndRemoveNav(BuildContext context, Widget route){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute<dynamic>(builder: (BuildContext context)=>route), (Route<dynamic> route) => false);
} // this pushes a screen and removes all other screens till it gets to the pushed screen

void popNav(BuildContext context) {
  Navigator.pop(context);
} //this pops the screen

Future<void> popRepeatedly({int? steps, BuildContext? context}) async {
  for (int i = 0; i < steps!; i++) {
    popNav(context!);
  }
} // pops as many screens as you want it to by specifying the number

void popToFirst(BuildContext context) {
  Navigator.of(context).popUntil((Route<dynamic> route) => route.isFirst);
} //similar to pushandremoveUntil, this function pops all screen till it gets to the first or home page.

