import 'package:flutter/material.dart';
import 'package:meupet/app/core/widget/text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _showSecondCheckBox = true;
  bool? isChecked = false;
  bool? isCheckedHero = false;
  bool showSecondCheckBox = true;
  String formFieldtext = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Form(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // Logo
            Image.asset(
              'assets/images/logo_register.png',
              width: 236,
              height: 198,
            ),
            // text name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MyPetFormField(
                label: 'name complete',
              ),
            ),
            const SizedBox(height: 15),

            // text password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MyPetFormField(
                label: 'password',
              ),
            ),
            const SizedBox(height: 15),
            // text repeat-password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MyPetFormField(
                label: 'confirm password',
              ),
            ),
            const SizedBox(height: 15),
            // text email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MyPetFormField(
                label: 'email',
              ),
            ),
            const SizedBox(height: 15),
            // text cpf
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MyPetFormField(
                label: 'cpf',
              ),
            ),
            const SizedBox(height: 15),
            // checkbox select
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CheckboxListTile(
                      shape: const CircleBorder(),
                      title: const Text('Tutor'),
                      value: isChecked,
                      onChanged: (tutorCheck) {
                        setState(() {
                          isChecked = tutorCheck;
                          if (isChecked!) {
                            isCheckedHero = false; // Desmarque o outro Checkbox
                          } else if (isCheckedHero!) {
                            isChecked = false;
                          } else {
                            _showSecondCheckBox = !isChecked!; //
                          }
                        });
                      },
                    ),
                    Visibility(
                      visible: _showSecondCheckBox,
                      child: CheckboxListTile(
                        title: const Text('Hero'),
                        value: isCheckedHero,
                        onChanged: (heroCheck) {
                          setState(() {
                            isCheckedHero = heroCheck;
                            if (isCheckedHero!) {
                              isChecked = false; // Desmarque o outro Checkbox
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(327, 50),
                  elevation: 0,
                  backgroundColor: const Color(0xffCBB279),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text('Sign In'),
              ),
            ),
          ]),
        ),
      ),
    )));
  }
}
