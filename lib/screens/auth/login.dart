import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tracked/screens/auth/auth_view_model.dart';
import 'package:tracked/components/customtextformfiels.dart';
import 'package:tracked/components/rounded_button.dart';


class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewodel>.reactive(
        viewModelBuilder: () => AuthViewodel(),
        builder: (context,  model, child) {
          return Scaffold(
            body: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
              child: ListView(
                children: [
                  Text(
                    'Tracked',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Form(
                    child: Column(
                      children: [
                        CustomTextFormField(
                          onChanged: (text) {},
                          controller: _emailController,
                          fieldLabel: 'Email address',
                        ),
                        SizedBox(height: 15.0),
                        CustomTextFormField(
                            onChanged: (text) {},
                            controller: _passwordController,
                            fieldLabel: 'Password'),
                        SizedBox(height: 20.0),
                        RoundedButton(
                          onPress: () {
                            //
                            // if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty && _fullnameController.text.isNotEmpty)
                            // {
                            //   model.signUp(
                            //       email: _emailController.text,
                            //       password: _passwordController.text,
                            //       fullname: _fullnameController.text,
                            //     onCallBack: (){
                            //         pushNavigator(context, DocList());
                            //     }
                            //   );
                            // }
                          },
                          buttoncolor: Colors.indigo,
                          buttonchild: Text(
                            'Register',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 18.0),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
