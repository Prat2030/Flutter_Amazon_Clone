import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // here we used this as textfield did not have any validator
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      validator: (val) {},
    );
  }
}
