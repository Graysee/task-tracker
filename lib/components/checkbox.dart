import 'package:flutter/material.dart';

class CustomListTileCheckBox extends StatelessWidget {
  final Widget? title;
  final bool? value;
  final void Function(bool?)? onChanged;
  const CustomListTileCheckBox({Key? key, this.value, this.title, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      trailing: Checkbox(value: value, onChanged: onChanged),
    );
  }
}
