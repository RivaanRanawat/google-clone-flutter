import 'package:flutter/material.dart';
// sign in button showing up in both the screens- search and main
class SigninButton extends StatelessWidget {
  const SigninButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10).copyWith(
        right: 10,
      ),
      child: MaterialButton(
        onPressed: () {},
        color: const Color(0xff1A73EB),
        child: const Text(
          'Sign in',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
