// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CheckBoxField extends StatelessWidget {
  final bool isChecked;
  final OutlinedBorder? checkboxShape;
  final String title;
  final bool value;
  final Color? activeColor;
  final ValueNotifier<bool> tutorSelect;
  const CheckBoxField({
    Key? key,
    this.isChecked = false,
    this.checkboxShape,
    required this.title,
    required this.value,
    this.activeColor,
    required Null Function(dynamic newBool) onChanged,
    required this.tutorSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: tutorSelect,
        builder: (_, selectTypeValue, child) {
          return CheckboxListTile(value: isChecked, onChanged: (newBool) {});
        });
  }
}
