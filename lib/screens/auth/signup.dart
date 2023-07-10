import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tracked/components/customtextformfiels.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tracked/components/rounded_button.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: ListView(
          children: [
            Text(
              'Safe Rider',
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
                    controller: _fullnameController,
                    fieldLabel: 'Full name',
                  ),
                  SizedBox(height: 15.0),
                  CustomTextFormField(
                    onChanged: (text) {},
                    controller: _emailController,
                    fieldLabel: 'Email address',
                  ),
                  SizedBox(height: 15.0),
                  CustomTextFormField(
                      onChanged: (text) {},
                      controller: _phonenumberController,
                      fieldLabel: 'Phone number'),
                  SizedBox(height: 15.0),
                  GestureDetector(
                    onTap: () async {
                      DateTime? startPickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2002),
                          firstDate: DateTime(1960),
                          lastDate: DateTime(2020));
                      String formattedDate =
                          '${startPickedDate!.day}-${startPickedDate.month}-${startPickedDate.year}';
                      _dobController.text = formattedDate;
                      // return _dobController.text;
                    },
                    child: CustomTextFormField(
                      onChanged: (text) {},
                      controller: _dobController,
                      fieldLabel: 'Date of birth',
                      enabled: false,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  CustomTextFormField(
                    onChanged: (text) {},
                    controller: _locationController,
                    fieldLabel: 'Location',
                    enabled: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  CustomTextFormField(
                      onChanged: (text) {},
                      controller: _genderController,
                      fieldLabel: 'Gender'),
                  SizedBox(height: 15.0),
                  CustomTextFormField(
                      onChanged: (text) {},
                      controller: _passwordController,
                      fieldLabel: 'Password'),
                  SizedBox(height: 20.0),
                  RoundedButton(
                    onPress: () {},
                    buttoncolor: Colors.deepOrange,
                    buttonchild: Text(
                      'Register',
                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}