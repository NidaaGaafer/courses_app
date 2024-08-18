import 'package:courses_app/pages/rest_password.dart';
import 'package:courses_app/widgets/app_button.dart';
import 'package:courses_app/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

class ResetPasswordEmailPage extends StatefulWidget {
  const ResetPasswordEmailPage({super.key});

  @override
  State<ResetPasswordEmailPage> createState() => _ResetPasswordEmailPageState();
}

class _ResetPasswordEmailPageState extends State<ResetPasswordEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Form(
                child: Expanded(
              child: Column(
                children: [
                  Text(' Reset Password'),
                  SizedBox(height: 100),
                  SizedBox(height: 10),
                  AppTextField(
                    keyboardType: TextInputType.emailAddress,
                    textFieldName: 'Email',
                  ),
                  SizedBox(height: 30),
                  AppButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => RestPasswordPage()));
                    },
                    name: 'SUBMIT',
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
