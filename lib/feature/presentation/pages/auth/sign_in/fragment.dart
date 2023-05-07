import 'package:flutter/material.dart';

import '../../../../../index.dart';

class AuthSignInFragment extends StatefulWidget {
  final AuthSignInHandler onSignIn;
  final AuthForgotHandler onForgetPassword;
  final AuthCreateHandler onCreateAccount;

  const AuthSignInFragment({
    Key? key,
    required this.onSignIn,
    required this.onForgetPassword,
    required this.onCreateAccount,
  }) : super(key: key);

  @override
  State<AuthSignInFragment> createState() => _AuthSignInFragmentState();
}

class _AuthSignInFragmentState extends State<AuthSignInFragment> {
  late PhoneEditingController phone;
  late PasswordEditingController password;

  @override
  void initState() {
    phone = PhoneEditingController();
    password = PasswordEditingController();
    super.initState();
  }

  @override
  void dispose() {
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
              text: "Sign in",
              textAlign: TextAlign.start,
              textColor: Colors.black,
              textStyle: FontWeight.bold,
              textSize: 24,
              margin: EdgeInsets.symmetric(vertical: 24),
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
            AppTextButton(
              width: double.infinity,
              textAlign: TextAlign.end,
              padding: const EdgeInsets.all(8),
              text: "Forget password?",
              onPressed: () => widget.onForgetPassword.call(AuthData(
                phoneNumber: phone.number.numberWithCode,
                password: password.text,
              )),
            ),
            CreateAccountTextView(
              width: double.infinity,
              textAlign: TextAlign.end,
              padding: const EdgeInsets.all(8),
              text: "Don't have an account? ",
              buttonText: "Sign up!",
              buttonTextColor: AppColors.primary,
              onPressed: () => widget.onCreateAccount.call(AuthData(
                phoneNumber: phone.number.numberWithCode,
                password: password.text,
              )),
            ),
            Button(
              margin: const EdgeInsets.symmetric(vertical: 24),
              text: "Login",
              borderRadius: 12,
              primary: AppColors.primary,
              onExecute: () => widget.onSignIn.call(AuthData(
                phoneNumber: phone.number.numberWithCode,
                password: password.text,
              )),
            ),
          ],
        ),
      ),
    );
  }
}