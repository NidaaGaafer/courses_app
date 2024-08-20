import 'package:courses_app/pages/home.dart';
import 'package:courses_app/pages/login.dart';
import 'package:courses_app/widgets/app_button.dart';
import 'package:courses_app/widgets/app_textfield.dart';
import 'package:courses_app/widgets/sign_in_with.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
            child: Column(
          children: [
            SizedBox(height: 10),
            Text('sign Un'),
            AppTextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              textFieldName: 'Full Name',
            ),
            SizedBox(height: 15),
            AppTextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textFieldName: 'Email',
            ),
            SizedBox(height: 15),
            AppTextField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              textFieldName: 'Password',
            ),
            SizedBox(height: 15),
            AppTextField(
                controller: confirmPasswordController,
                keyboardType: TextInputType.text,
                textFieldName: 'Confirm Password'),
            SizedBox(height: 60),
            AppButton(
              onPressed: () async {
                try {
                  var credentials = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text);
                  if (credentials.user != null) {
                    credentials.user!.updateDisplayName(nameController.text);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Account created successfully')));
                    await Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) => const HomePage()));
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak.password') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('The Password provided is too weak')));
                  } else if (e.code == 'email-already-in-use') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'The account already exists for that email.')));
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Singn up Exception $e')));
                }
              },
              name: 'LOGIN',
            ),
            SizedBox(height: 30),
            Expanded(
              child: SignInWith(
                haveAccount: 'Already  have an account',
                buttonName: 'Login Here',
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) => LoginPage()));
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
