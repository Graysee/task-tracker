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
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: ()=>AuthViewModel(),
      builder: (context, model, child){
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
                      textEditingController: _emailController,
                      fieldLabel: 'Email address',
                    ),
                    SizedBox(height: 15.0),
                    CustomTextFormField(
                      keyboardtype: TextInputType.visiblePassword,
                        // obscuretext: true,
                        onChanged: (text) {},
                        textEditingController: _passwordController,
                        fieldLabel: 'Password'),
                    SizedBox(height: 20.0),
                    RoundedButton(
                      onPress: () {

                        if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty)
                        {
                          model.login(
                                email: _emailController.text,
                                password: _passwordController.text
                              );
                            }
                        },
                      buttoncolor: Colors.indigo,
                      buttonchild: Text(
                        'Log in',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 18.0),
                      ),
                    ),
                    Row(
                      children: [
                        Text('Do not have an account?'),
                        GestureDetector(
                          onTap: (){
                            model.navigateToSignup();
                          },
                            child: Text('Sign up', style: TextStyle(color: Colors.indigo),))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );}
    );
  }
}
