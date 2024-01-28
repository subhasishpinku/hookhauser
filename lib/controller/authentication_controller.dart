import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookah_user/models/EmailCheackModel.dart';
import 'package:hookah_user/models/ProductList.dart';
import 'package:hookah_user/models/registration_model.dart';
import 'package:hookah_user/models/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hookah_user/utils/constants/constants.dart';
import 'package:hookah_user/view/screens/sharepreferance.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  String? value;
  Rx<UserModel> userModel = UserModel().obs;
  Rx<RegistrationModel> registrationModel = RegistrationModel().obs;
  Rx<EmailCheack> emailcheack = EmailCheack().obs;
  Rx<Users> emailuser = Users().obs;
  // Firebase
  final FirebaseAuth auth = FirebaseAuth.instance;
  RxString profilePhotoUrl = "".obs;
  // Login
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  // SignUp
  TextEditingController name = TextEditingController();
  // forgot password email
  TextEditingController forgotPasswordEmail = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  // email validation
  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  // is valid mobile number
  bool isValidMobile(String phone) {
    String code = "91";
    return RegExp(r'^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$')
        .hasMatch(code + phone);
  }

  // ^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$
  // Register User

  Future facebookLogin({String? name, String? email, String? image}) async {
    var user;
    Map<String, dynamic> data = {
      "name": name ?? "NA",
      "email": email ?? "NA",
      "image": image ??
          "https://sapcotechnologies.com/book_my_smoke/public/images/1661164983.jpg"
    };
    try {
      EasyLoading.show(status: "Please wait...");
      var response = await http.post(
        Uri.parse(
          baseUrl + "fblogin",
        ),
        body: data,
      );
      print("response" + response.body);
      user = await json.decode(response.body);
      String msg = user['message'];
      if (user['status'] == "200") {
        Fluttertoast.showToast(msg: msg);
        Get.toNamed("TAB_CONTROLLER_PAGE");
      } else if (user['status'] == "203") {
        Fluttertoast.showToast(msg: msg);
      } else {
        Fluttertoast.showToast(
            msg: "There was some problem signing you up. Please try again!");
      }
      var userDataRegistration = RegistrationModel.fromJson(user);
      registrationModel.update((val) {
        val!.status = userDataRegistration.status;
        val.name = userDataRegistration.name;
        val.message = userDataRegistration.message;
        val.accessToken = userDataRegistration.accessToken;
        val.tokenType = userDataRegistration.tokenType;
        val.expiresAt = userDataRegistration.expiresAt;
      });
      print("MODEL : ${registrationModel.toJson()}");
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      print("SIGN UP $e");
    }
  }

  Future googleLogin({String? name, String? email, String? image}) async {
    var user;
    Map<String, dynamic> data = {
      "name": name ?? "NA",
      "email": email ?? "NA",
      "image": image ??
          "https://sapcotechnologies.com/book_my_smoke/public/images/1661164983.jpg"
    };
    try {
      EasyLoading.show(status: "Please wait...");
      var response = await http.post(
        Uri.parse(
          baseUrl + "googlelogin",
        ),
        body: data,
      );
      print("response" + response.body);
      user = await json.decode(response.body);
      String msg = user['message'];
      if (user['status'] == "200") {
        Fluttertoast.showToast(msg: msg);
        Get.toNamed("TAB_CONTROLLER_PAGE");
      } else if (user['status'] == "203") {
        Fluttertoast.showToast(msg: msg);
      } else {
        Fluttertoast.showToast(
            msg: "There was some problem signing you up. Please try again!");
      }
      var userDataRegistration = RegistrationModel.fromJson(user);
      registrationModel.update((val) {
        val!.status = userDataRegistration.status;
        val.name = userDataRegistration.name;
        val.message = userDataRegistration.message;
        val.accessToken = userDataRegistration.accessToken;
        val.tokenType = userDataRegistration.tokenType;
        val.expiresAt = userDataRegistration.expiresAt;
      });
      print("MODEL : ${registrationModel.toJson()}");
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      print("SIGN UP $e");
    }
  }

  Future register(
      {String? name,
      String? email,
      String? mobile,
      String? password,
      String? confirm_password}) async {
    var user;
    Map<String, dynamic> data = {
      "name": name ?? "NA",
      "email": email ?? "NA",
      "mobile": mobile ?? "NA",
      "password": password ?? "NA",
      "confirm_password": confirm_password ?? "NA",
    };
    try {
      EasyLoading.show(status: "Please wait...");
      var response = await http.post(
        Uri.parse(
          baseUrl + "register",
        ),
        body: data,
      );
      print("response" + response.body);
      user = await json.decode(response.body);
      String msg = user['message'];
      // if (response.statusCode == 200) {
      //   user = await json.decode(response.body);
      //   print("register" + user);
      // }
      // else {
      //   Fluttertoast.showToast(
      //       msg: "There was some problem signing you up. Please try again!");
      // }
      if (user['status'] == "200") {
        Fluttertoast.showToast(msg: msg);
        Get.toNamed("TAB_CONTROLLER_PAGE");
      } else if (user['status'] == "203") {
        Fluttertoast.showToast(msg: msg);
      } else {
        Fluttertoast.showToast(
            msg: "There was some problem signing you up. Please try again!");
      }
      var userDataRegistration = RegistrationModel.fromJson(user);
      registrationModel.update((val) {
        val!.status = userDataRegistration.status;
        val.name = userDataRegistration.name;
        val.message = userDataRegistration.message;
        val.accessToken = userDataRegistration.accessToken;
        val.tokenType = userDataRegistration.tokenType;
        val.expiresAt = userDataRegistration.expiresAt;
      });
      print("MODEL : ${registrationModel.toJson()}");
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      print("SIGN UP $e");
    }
  }

  Future login(
    String email,
    String password,
  ) async {
    var user;
    Map<String, dynamic> data = {
      "email": email,
      "password": password,
    };
    try {
      EasyLoading.show(status: "Please wait...");
      var response = await http.post(
        Uri.parse(
          // "https://sapcotechnologies.com/Projects/book-my-smoke/bookmysmoke_api/login.php",
          "https://bms.sapcotechnologies.com/api/login",
        ),
        body: data,
      );
      if (response.statusCode == 200) {
        user = await json.decode(response.body);
        print(user);
      } else {
        Fluttertoast.showToast(
            msg: "There was some problem signing you up. Please try again!");
      }
      if (user['status'] == "200") {
        String token = user['access_token'];
        saveValue(token);
        saveEmail(email);
        // EasyLoading.dismiss();
      } else if (user['status'] == "203") {
        Fluttertoast.showToast(msg: "Error Logging in");
        EasyLoading.dismiss();
      }
      // if (user['status_code'] == 406) {
      //   Fluttertoast.showToast(msg: "Please enter the email");
      // }
      // if (user['status_code'] == 407) {
      //   Fluttertoast.showToast(msg: "Please enter the password");
      // }
      var userData = UserModel.fromJson(user);
      print("User Data ${userData}");
      userModel.update((val) {
        val!.status = userData.status;
        val.id = userData.id;
        val.name = userData.name;
        val.message = userData.message;
        val.accessToken = userData.accessToken;
        val.tokenType = userData.tokenType;
        val.expiresAt = userData.expiresAt;
      });
      EasyLoading.dismiss();
      print("MODEL : ${userModel.toJson()}");
    } catch (e) {
      EasyLoading.dismiss();
      print("SIGN UP $e");
    }
  }

  Future<void> saveValue(String token) async {
    print("object" + "hi" + token);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    value = prefs.getString("token");
    print("ordertoken" + value!);
    Get.toNamed("TAB_CONTROLLER_PAGE");
  }

  Future<void> saveEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    value = prefs.getString("email");
  }
// getValue() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     print("token" + " " +stringValue!);
//     return stringValue;
//   }
  Future checkOtp(
    String otp,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? emailID = prefs.getString("email");
    var userotp;
    Map<String, dynamic> data = {"email": emailID, "your_otp": otp};
    try {
      EasyLoading.show(status: "Please wait...");
      var response = await http.post(
        Uri.parse(
          baseUrl + "otp",
        ),
        body: data,
      );
      print("responseOtp" + response.body);
      if (response.statusCode == 200) {
        userotp = await json.decode(response.body);
        print(userotp);
      } else {
        Fluttertoast.showToast(
            msg: "There was some problem signing you up. Please try again!");
      }
      // userotp = await json.decode(response.body);
      if (userotp['status'] == "1") {
        String sms = userotp['message'];
        Fluttertoast.showToast(msg: sms);
        Get.toNamed("CHANGE_PASSWORD");
        EasyLoading.dismiss();
      } else {
        Fluttertoast.showToast(msg: "Error Logging in");
        EasyLoading.dismiss();
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("SIGN UP $e");
    }
  }

  Future checkMail(
    String email,
  ) async {
    var useremail;
    Map<String, dynamic> data = {
      "email": email,
    };
    try {
      EasyLoading.show(status: "Please wait...");
      var response = await http.post(
        Uri.parse(
          baseUrl + "mail",
        ),
        body: data,
      );
      print("responseEmail" + response.body);
      if (response.statusCode == 200) {
        useremail = await json.decode(response.body);
        print(useremail);
      } else {
        Fluttertoast.showToast(
            msg: "There was some problem signing you up. Please try again!");
      }
      // useremail = await json.decode(response.body);
      if (useremail['status'] == "1") {
        String emails = useremail['users']['email'];
        print("user_email" + emails);
        saveEmail(emails);
        Get.toNamed("OTP");
        EasyLoading.dismiss();
      } else {
        Fluttertoast.showToast(msg: "Error Logging in");
        EasyLoading.dismiss();
      }

      var userDataEmail = Users.fromJson(useremail);
      print("User Email ${userDataEmail}");
      emailuser.update((val) {
        val!.id = userDataEmail.id;
        val.name = userDataEmail.name;
        val.mobile = userDataEmail.mobile;
        val.address = userDataEmail.address;
        val.emailVerifiedAt = userDataEmail.emailVerifiedAt;
        val.role = userDataEmail.role;
        val.wishList = userDataEmail.wishList;
        val.cartList = userDataEmail.cartList;
        val.walletBalance = userDataEmail.walletBalance;
        val.status = userDataEmail.status;
        val.image = userDataEmail.image;
        val.wstreet = userDataEmail.wstreet;
        val.warea = userDataEmail.warea;
        val.wcity = userDataEmail.wcity;
        val.wdistrict = userDataEmail.wdistrict;
        val.wstate = userDataEmail.wstate;
        val.wpin = userDataEmail.wpin;
        val.astreet = userDataEmail.astreet;
        val.aarea = userDataEmail.aarea;
        val.acity = userDataEmail.acity;
        val.adistrict = userDataEmail.adistrict;
        val.astate = userDataEmail.astate;
        val.apin = userDataEmail.apin;
        val.createdAt = userDataEmail.createdAt;
        val.updatedAt = userDataEmail.updatedAt;
        val.otp = userDataEmail.otp;
      });
      EasyLoading.dismiss();
      print("User Email : ${userDataEmail.toJson()}");
    } catch (e) {
      EasyLoading.dismiss();
      print("SIGN UP $e");
    }
  }

  Future changePassword(String password, String confirm_password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? emailID = prefs.getString("email");
    var userchangepassword;
    Map<String, dynamic> data = {
      "email": emailID,
      "newpass": password,
      "confirmpass": confirm_password,
    };

    try {
      EasyLoading.show(status: "Please wait...");
      var response = await http.post(
        Uri.parse(
          baseUrl + "update_pass",
        ),
        body: data,
      );
      print("responseChangePass" + response.body);
      if (response.statusCode == 200) {
        userchangepassword = await json.decode(response.body);
        print(userchangepassword);
      } else {
        Fluttertoast.showToast(
            msg: "There was some problem signing you up. Please try again!");
      }
      // userchangepassword = await json.decode(response.body);
      // String sts = userchangepassword[0]['status'];
      // print("sts" + sts);
      if (userchangepassword[0]['status'] == "success") {
        String sms = userchangepassword[0]['msg'];
        Fluttertoast.showToast(msg: sms);
        Get.toNamed("LOGIN");
        EasyLoading.dismiss();
      } else {
        Fluttertoast.showToast(msg: "Error Logging in");
        EasyLoading.dismiss();
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("CHANGEPASSWORD $e");
    }
  }

  signUp(
    String name,
    String email,
    String mobile,
    String password,
    String confirm_password,
  ) async {
    await register(
        name: name,
        email: email,
        mobile: mobile,
        password: password,
        confirm_password: confirm_password);
  }

  // sign up with google
  Future signInWithGoogle() async {
    UserCredential user;
    try {
      await EasyLoading.show(status: "Loading...");
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      name.text = googleUser!.displayName!;
      email.text = googleUser.email;
      profilePhotoUrl.value = googleUser.photoUrl!;
      print("User email google ${email.text}");
      // TODO: Create user.
      // await register(
      //   name: name.text,
      //   email: email.text,
      //   // image: profilePhotoUrl.value,
      // );
      await googleLogin(
        name: name.text,
        email: email.text,
        image: profilePhotoUrl.value,
      );
      // Get.toNamed("TAB_CONTROLLER_PAGE");
      user = await FirebaseAuth.instance.signInWithCredential(credential);
      await EasyLoading.dismiss();
      return user;
    } catch (e) {
      EasyLoading.dismiss();
      print("Google sign in exception : $e");
    }
  }

  // Facebook sign up
  Future signInWithFacebook() async {
    UserCredential user;
    try {
      EasyLoading.show(status: "Loading...");
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      name.text = auth.currentUser!.displayName!;
      email.text = auth.currentUser!.email!;
      profilePhotoUrl.value = auth.currentUser!.photoURL!;
      // print("User email facebook ${auth.currentUser!.email}");
      // TODO:Create user
      await facebookLogin(
        name: name.text,
        email: email.text,
        image: profilePhotoUrl.value,
      );
      user = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      Get.toNamed("TAB_CONTROLLER_PAGE");
      EasyLoading.dismiss();
      return user;
    } catch (e) {
      EasyLoading.dismiss();
      print("Facebook sign in expection : $e");
    }
  }

  // sign out
  Future<void> signOut() async {
    await auth.signOut();
  }
}

// RESPONSE BODY : {status: true, message: Successfully Registered,
//data: {id: null, name: rishab, email: re@gmail.com, mobile: NA, address: NA, email_verified_at: 2022-06-14 18:14:50.295702, password: 123456, role: user, image: https://images.pexels.com/photos/1047319/pexels-photo-1047319.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1, remember_token: null, created_at: 2022-06-14 18:14:50.298433, updated_at: 2022-06-14 18:14:50.298471}}
