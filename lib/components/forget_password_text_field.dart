import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxBool _passwordVisible = false.obs;

Widget forgotPasswordTextField(
    {Icon? preIcon,
    bool? isPassword,
    String? label,
    TextEditingController? controller,
    TextInputType? keyboardType,
    validator}) {
  return Container(
    padding: const EdgeInsets.only(left: 30, right: 10),
    margin: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 199, 217, 232),
        blurRadius: 10,
        blurStyle: BlurStyle.outer,
        spreadRadius: 2,
        offset: Offset.fromDirection(.2),
      )
    ], borderRadius: BorderRadius.circular(50), color: Colors.white),
    child: TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword! ? !_passwordVisible.value : false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: label,
        prefixIcon: preIcon,
        suffixIcon: isPassword
            ? Obx(() {
                return IconButton(
                  icon: Icon(_passwordVisible.value
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    _passwordVisible.value = !_passwordVisible.value;
                  },
                );
              })
            : null,
        disabledBorder: InputBorder.none,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
