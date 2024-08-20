import 'package:flutter/material.dart';

class SignInWith extends StatelessWidget {
  final String haveAccount;
  final String buttonName;
  final void Function()? onPressed;
  const SignInWith(
      {super.key,
      required this.haveAccount,
      required this.buttonName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Text(' Or Sign With '),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Image.asset('assets/images/facebook.png',
                        height: 60, width: 60),
                    Text('Sign In With Facebook')
                  ],
                )),
            ElevatedButton(
                onPressed: () {},
                child: Image.asset('assets/images/google.png',
                    height: 60, width: 60))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$haveAccount?'),
            TextButton(onPressed: onPressed, child: Text('$buttonName'))
          ],
        )
      ],
    );
  }
}
