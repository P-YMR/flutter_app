import 'package:flutter/material.dart';

import '../../../../../index.dart';

class AuthSignUpFragment extends StatefulWidget {
  final AuthSignInHandler onSignIn;
  final AuthSignUpHandler onSignUp;

  const AuthSignUpFragment({
    Key? key,
    required this.onSignIn,
    required this.onSignUp,
  }) : super(key: key);

  @override
  State<AuthSignUpFragment> createState() => _AuthSignUpFragmentState();
}

class _AuthSignUpFragmentState extends State<AuthSignUpFragment> {
  late EmailEditingController email;
  late PhoneEditingController phone;
  late PasswordEditingController password;

  @override
  void initState() {
    email = EmailEditingController();
    phone = PhoneEditingController();
    password = PasswordEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextView(
              width: double.infinity,
              text: "Create a new account",
              textAlign: TextAlign.start,
              textColor: Colors.black,
              textStyle: FontWeight.bold,
              textSize: 24,
              margin: EdgeInsets.symmetric(vertical: 24),
            ),
            EmailField(
              hint: "Enter your email",
              controller: email,
            ),
            PhoneField(
              controller: phone,
              textCode: "+880",
              hintCode: "+880",
              hintNumber: "Enter phone number",
            ),
            PasswordField(
              hint: "Enter your password",
              controller: password,
              margin: EdgeInsets.zero,
            ),
            CreateAccountTextView(
              width: double.infinity,
              textAlign: TextAlign.end,
              padding: const EdgeInsets.all(8),
              text: "Already have an account! ",
              buttonText: "Sign in",
              buttonTextColor: AppColors.primary,
              onPressed: () => widget.onSignIn(AuthData(
                email: email.text,
                password: password.text,
                phoneNumber: phone.number.numberWithCode,
              )),
            ),
            Button(
              margin: const EdgeInsets.symmetric(vertical: 24),
              text: "Register",
              borderRadius: 12,
              primary: AppColors.primary,
              onExecute: () => widget.onSignUp.call(AuthData(
                email: email.text,
                password: password.text,
                phoneNumber: phone.number.numberWithCode,
              )),
            ),
          ],
        ),
      ),
    );
  }
}