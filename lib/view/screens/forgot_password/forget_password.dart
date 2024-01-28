// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hookah_user/components/create_text_field.dart';
import 'package:hookah_user/controller/authentication_controller.dart';

class ForgetpasswordPage extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  ForgetpasswordPage({Key? key}) : super(key: key);
  final _form = GlobalKey<FormState>();
  // emailcheck() async {
  //   final valid = _form.currentState!.validate();
  //   if (!valid) {
  //   } else {
  //      await authenticationController.forgotPasswordemail(
  //       authenticationController.forgotPasswordEmail.text,
  //     );
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Fogot Password",
      )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                "You'll recieve an OTP on your registered email address.",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset('images/forgetpass.png'),
              createdTextField(
                preIcon: const Icon(Icons.person),
                isPassword: false,
                label: 'Enter Your Email',
                keyboardType: TextInputType.emailAddress,
                controller: authenticationController.forgotPasswordEmail,
                validator: ((String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                }),
              ),
              // TextField(
              //   controller: authenticationController.forgotPasswordEmail,
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Get.offNamed("OTP");
                      },
                      child: Text(
                        'Remember password? Login',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.only(
                      right: 30, left: 30, top: 4, bottom: 4)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                onPressed: () async {
                  if (authenticationController.forgotPasswordEmail.text != "" &&
                      authenticationController.isValidEmail(
                          authenticationController.forgotPasswordEmail.text)) {
                    await authenticationController.checkMail(
                      authenticationController.forgotPasswordEmail.text,
                    );
                  } else {
                    Get.snackbar(
                      "Error",
                      "Invalid credentials",
                      borderRadius: 0,
                      maxWidth: double.infinity,
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.all(12),
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                child: Text(
                  'Send',
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
