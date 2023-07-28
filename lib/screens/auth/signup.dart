import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:tracked/components/customtextformfiels.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tracked/components/rounded_button.dart';
import 'package:tracked/screens/auth/auth_view_model.dart';
import 'package:tracked/screens/task_view/task_list_view.dart';
import 'package:tracked/utils/navigator.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final TextEditingController _fullnameController = TextEditingController();
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
                      textEditingController: _fullnameController,
                      fieldLabel: 'Full name',
                    ),
                    SizedBox(height: 15.0),
                    CustomTextFormField(
                      onChanged: (text) {},
                      textEditingController: _emailController,
                      fieldLabel: 'Email address',
                    ),
                    SizedBox(height: 15.0),
                    CustomTextFormField(
                        onChanged: (text) {},
                        textEditingController: _passwordController,
                        fieldLabel: 'Password'),
                    SizedBox(height: 20.0),
                    RoundedButton(
                      onPress: () {
                        if (
                        _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty && _fullnameController.text.isNotEmpty
                        ) {
                          model.signUp(email: _emailController.text, password: _passwordController.text, fullName: _fullnameController.text);
                        }},
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
      );}
    );
  }
}
