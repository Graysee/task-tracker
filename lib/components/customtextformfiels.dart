import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
        required this.controller,
        this.fieldLabel,
        this.icon,
        this.enabled,
        this.onChanged});

  final TextEditingController? controller;
  final String? fieldLabel;
  final Widget? icon;
  final bool? enabled;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(50)],
      cursorColor: Colors.black,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        // hintText: 'Full Name',
        // hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        labelText: fieldLabel,
        labelStyle: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 17.0),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              // style: BorderStyle.none,
                color: Colors.black,
                width: 2.0)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              // style: BorderStyle.none,
                color: Colors.black,
                width: 2.0)),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            // style: BorderStyle.none,
              color: Colors.black,
              width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            // style: BorderStyle.none,
              color: Colors.black,
              width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.black, width: 2.0)),
        filled: true,
        fillColor: Colors.transparent,
        suffixIcon: icon,
      ),
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: enabled,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "Text field can\'t be empty";
        }
        if (text.length < 4 || text.length > 49) {
          return "please enter a valid response";
        }
      },
    );
  }
}
