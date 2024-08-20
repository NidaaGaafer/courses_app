import 'package:courses_app/pages/sign_up.dart';
import 'package:courses_app/widgets/app_button.dart';
import 'package:courses_app/widgets/app_textfield.dart';
import 'package:courses_app/widgets/sign_in_with.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
            child: Column(
          children: [
            Text('Login'),
            SizedBox(height: 40),
            AppTextField(
              keyboardType: TextInputType.emailAddress,
              textFieldName: 'Email',
            ),
            SizedBox(height: 20),
            AppTextField(
              keyboardType: TextInputType.text,
              textFieldName: 'Password',
            ),
            SizedBox(height: 60),
            AppButton(
              // onPressed: () {},
              name: 'LOGIN',
            ),
            SizedBox(height: 30),
            SignInWith(
              haveAccount: 'Don\'t have an account',
              buttonName: 'Sign Up Here',
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (ctx) => SignUpPage()));
              },
            ),
          ],
        )),
      ),
    );
  }
}
