import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tracked/screens/add_task/add_task_view.dart';
import 'package:tracked/screens/auth/login.dart';
import 'package:tracked/screens/auth/signup.dart';
import 'package:tracked/screens/doclist.dart';
import 'package:tracked/screens/startup_view/startupview.dart';
import 'package:tracked/constants/route_names_asigning.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startupRoute:
        return MaterialPageRoute(builder: (_) => StartUpView());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => SignUp());
      case doclistRoute:
        return MaterialPageRoute(builder: (_) => DocList());
      case addtaskRoute:
        return MaterialPageRoute(builder: (_) => AddTasks());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LogIn());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

/// also write a case for the screen that needs an argument
