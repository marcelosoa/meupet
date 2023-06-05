import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPetFormField extends StatelessWidget {
  final String label;
  final IconButton? suffixIconButton;
  final bool obscureText;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  MyPetFormField(
      {Key? key,
      required this.label,
      this.suffixIconButton,
      this.obscureText = false,
      this.controller,
      this.validator})
      : assert(obscureText == true ? suffixIconButton == null : true,
            'ObsctureText não pode ser enviado com suffixinIcon'),
        obscureTextVN = ValueNotifier(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: obscureTextVN,
        builder: (_, obscureTextValue, child) {
          return TextFormField(
            style: const TextStyle(color: Colors.black),
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color(0xffCBB279)),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffCBB279)),
                    borderRadius: BorderRadius.circular(15)),
                fillColor: Colors.white,
                focusColor: Colors.white,
                labelText: label,
                labelStyle: GoogleFonts.montserrat(
                    textStyle: const TextStyle(color: Colors.black)),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                errorBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                suffixIcon: suffixIconButton ??
                    (obscureText == true
                        ? IconButton(
                            onPressed: () {
                              obscureTextVN.value = !obscureTextValue;
                            },
                            icon: Icon(
                              !obscureTextValue
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined,
                              size: 20,
                            ))
                        : null)),
            obscureText: obscureTextValue,
          );
        });
  }
}
