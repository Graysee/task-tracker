import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'startupview_view_model.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return ViewModelBuilder<StartUpViewModel>.reactive(
        viewModelBuilder: () => StartUpViewModel(),
        onViewModelReady: (model) => model.handleStartUpLogic(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 300, height: 100, child: Column(
                    children: [
                      Text('Tracked', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.indigo,fontSize: 30), textAlign: TextAlign.center,),
                      SizedBox(height: 10.0,),
                      StepProgressIndicator(
                        totalSteps: 50,
                        currentStep: 32,
                        size: 12,
                        padding:0,
                        selectedColor: Colors.yellow,
                        unselectedColor: Colors.cyan,
                        roundedEdges: Radius.circular(10),
                        selectedGradientColor: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.indigo, Colors.blueGrey],
                        ),
                        unselectedGradientColor: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.black, Colors.blue],
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          );
        });
  }
}
