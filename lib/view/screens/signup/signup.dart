// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hookah_user/components/create_text_field.dart';
import 'package:hookah_user/components/forget_password_text_field.dart';
import 'package:hookah_user/components/primary_button.dart';
import 'package:hookah_user/controller/authentication_controller.dart';
import 'package:hookah_user/view/screens/login/login.dart';

class SignupPage extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  SignupPage({Key? key}) : super(key: key);
  final _form = GlobalKey<FormState>();
  saveRegistration(BuildContext context) async {
    final valid = _form.currentState!.validate();
    if (!valid) {
      Get.snackbar(
        "Error",
        "Invalid credentials",
        borderRadius: 0,
        maxWidth: double.infinity,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.all(12),
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      await authenticationController.signUp(
        authenticationController.name.text,
        authenticationController.email.text,
        "+91" + authenticationController.phoneNo.text,
        authenticationController.password.text,
        authenticationController.confirm_password.text,
      );
    }
  }

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
                'Create an Account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Register your account.',
                style: GoogleFonts.poppins(fontSize: 20),
              ),
              createdTextField(
                preIcon: const Icon(Icons.person),
                isPassword: false,
                label: 'Full name',
                keyboardType: TextInputType.name,
                controller: authenticationController.name,
                validator: ((String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                }),
              ),
              createdTextField(
                preIcon: const Icon(Icons.email),
                isPassword: false,
                keyboardType: TextInputType.emailAddress,
                label: 'Email',
                controller: authenticationController.email,
                validator: ((String? value) {
                  if (value!.isEmpty) {
                    return "Please enter an email";
                  }
                  if (!authenticationController.isValidEmail(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                }),
              ),
              createdTextField(
                prefixText: "+91 - ",
                preIcon: const Icon(Icons.phone_android),
                isPassword: false,
                keyboardType: TextInputType.phone,
                label: 'Phone Number',
                controller: authenticationController.phoneNo,
                validator: ((String? value) {
                  if (value!.isEmpty) {
                    return "Please enter your mobile number";
                  }
                  if (!authenticationController.isValidMobile(value)) {
                    return "Please enter a valid phone Number";
                  }
                  return null;
                }),
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
                  // validator: ((String? value) {
                  //   if (value!.isEmpty) {
                  //     return 'Please re-enter your password';
                  //   }
                  //   if (value.toString() !=
                  //       authenticationController.confirm_password.text.trim()) {
                  //     return "Passwords not match";
                  //   }
                  //   return null;
                  // }),
                  controller: authenticationController.confirm_password,
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
              const SizedBox(
                height: 26,
              ),
              primaryButton(
                context,
                label: "SIGN UP",
                onPressed: () async {
                  await saveRegistration(context);
                },
              ),
              const SizedBox(height: 7),
              InkWell(
                child: const Text('Already have an account? Login'),
                onTap: () {
                  Get.offAll(Login());
                },
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Image.asset('images/gsign.png'),
                    onTap: () async {
                      await authenticationController.signInWithGoogle();
                    },
                  ),
                  InkWell(
                    child: Image.asset('images/fsign.png'),
                    onTap: () async {
                      await authenticationController.signInWithFacebook();
                    },
                  ),
                  // googlesignin
                  // facebook signin
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// https://book-my-smoke-3a08a.firebaseapp.com/__/auth/handler