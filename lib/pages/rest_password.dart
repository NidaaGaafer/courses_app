import 'package:courses_app/widgets/app_button.dart';
import 'package:courses_app/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

class RestPasswordPage extends StatefulWidget {
  const RestPasswordPage({super.key});

  @override
  State<RestPasswordPage> createState() => _RestPasswordPageState();
}

class _RestPasswordPageState extends State<RestPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
            child: Expanded(
          child: Column(
            children: [
              Text(' Reset Password'),
              SizedBox(height: 100),
              AppTextField(
                keyboardType: TextInputType.emailAddress,
                textFieldName: 'Password',
              ),
              SizedBox(height: 30),
              AppTextField(
                  keyboardType: TextInputType.text,
                  textFieldName: 'Confirm Password'),
              SizedBox(height: 50),
              AppButton(
                //onPressed: () {},
                name: 'SUBMIT',
              )
            ],
          ),
        )),
      ),
    );
  }
}
