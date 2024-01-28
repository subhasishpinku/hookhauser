// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hookah_user/components/create_text_field.dart';
import 'package:hookah_user/components/primary_button.dart';
import 'package:hookah_user/controller/authentication_controller.dart';

class Login extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  Login({Key? key}) : super(key: key);

  final _form = GlobalKey<FormState>();

  saveLogin() async {
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
      await authenticationController.login(
        authenticationController.email.text,
        authenticationController.password.text,
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
                'Welcome',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              Text(
                'Sign in to continue',
                style: GoogleFonts.poppins(fontSize: 20),
              ),
              createdTextField(
                preIcon: const Icon(Icons.email),
                isPassword: false,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: authenticationController.email,
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Please enter an email";
                  }
                  if (!authenticationController.isValidEmail(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                }),
              ),
              Obx(
                () => createdTextField(
                  preIcon: const Icon(Icons.lock),
                  isPassword: true,
                  label: 'Password',
                  controller: authenticationController.password,
                  validator: ((String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter your passsord';
                    }
                    if (value.length < 4) {
                      return 'Please enter atleat 5 caracters';
                    }
                    return null;
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Text(
                        'Forgot Password',
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      onTap: () {
                        authenticationController.password.clear();
                        authenticationController.email.clear();
                        Get.toNamed("FORGOT_PASSWORD");
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              primaryButton(
                context,
                label: "LOGIN",
                onPressed: () async {
                  await saveLogin();
                  // await saveRegistration(context);
                  // Get.toNamed("TAB_CONTROLLER_PAGE");
                },
              ),
              const SizedBox(height: 7),
              InkWell(
                child: const Text('Don’t have an account? Sign up'),
                onTap: () {
                  Get.offNamed("SIGNUP");
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
              Text(
                'Login with OTP',
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
