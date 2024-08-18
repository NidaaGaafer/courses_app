import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String textFieldName;
  const AppTextField(
      {super.key,
      required this.keyboardType,
      required this.textFieldName,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textFieldName),
        Container(
          width: 400,
          child: TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            textInputAction: TextInputAction.next,
            autocorrect: true,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            )),
          ),
        ),
      ],
    );
  }
}
