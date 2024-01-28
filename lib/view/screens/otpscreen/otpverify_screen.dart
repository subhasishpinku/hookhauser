// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hookah_user/components/create_text_field.dart';
import 'package:hookah_user/components/forget_password_text_field.dart';
import 'package:hookah_user/components/primary_button.dart';
import 'package:hookah_user/controller/authentication_controller.dart';

class Otpverify extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  Otpverify({Key? key}) : super(key: key);
  final _form = GlobalKey<FormState>();

  // saveRegistration(BuildContext context) async {
  //   final valid = _form.currentState!.validate();
  //   if (!valid) {
  //   } else {}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Image.asset(
                  'images/loginDesign.png',
                  fit: BoxFit.fill,
                ),
              ),
              Image.asset('images/bmsLogo.png'),
              const Text(
                'Account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Change your password.',
                style: GoogleFonts.poppins(fontSize: 20),
              ),
              Obx(
                () => createdTextField(
                  preIcon: const Icon(Icons.lock),
                  isPassword: true,
                  label: 'Password',
                  // textValue: password,
                  // firstPassword: true,
                  controller: authenticationController.password,
                  validator: ((String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter your passsord';
                    }
                    if (value.length < 5) {
                      return 'Please enter atleat 5 caracters';
                    }
                    return null;
                  }),
                ),
              ),
              Obx(
                () => forgotPasswordTextField(
                  preIcon: const Icon(Icons.lock),
                  isPassword: true,
                  label: 'Confirm Password',
                  validator: ((String? value) {
                    if (value!.isEmpty) {
                      return 'Please re-enter your password';
                    }
                    if (value.toString() !=
                        authenticationController.password.text.trim()) {
                      return "Passwords not match";
                    }
                    return null;
                  }),
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              primaryButton(
                context,
                label: "Submit",
                onPressed: () async {
                  // await saveRegistration(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}