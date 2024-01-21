import 'package:flutter/material.dart';
import 'package:moodswing_client/presentation/common/layout/default_layout.dart';
import 'package:moodswing_client/presentation/common/widgets/custom_text_form_field.dart';
import 'package:moodswing_client/presentation/signin/view/signin_screen.dart';
import 'package:moodswing_client/presentation/signin/view/welcome_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final bool isVerified;
  const ForgotPasswordScreen({this.isVerified = true, super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 50),
              Container(
                  padding: const EdgeInsets.only(left: 4),
                  alignment: Alignment.centerLeft,
                  child: const Text("Forgot Password?",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w700))),
              const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                  child: Text(
                    'Enter your email',
                    style: TextStyle(fontSize: 16),
                  )),
              const SizedBox(height: 28),
              CustomTextFormField(
                onChanged: (p0) {},
                hintText: 'Email',
              ),
              if (widget.isVerified)
                CustomTextFormField(
                  onChanged: (p0) {},
                  hintText: 'Code',
                ),
              if (widget.isVerified)
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const SignInScreen()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Didn't receive your code?",
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Resend',
                          style: TextStyle(fontSize: 14.0),
                        )
                      ],
                    ),
                  ),
                ),
              const Spacer(),
              //const SizedBox(height: 50),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          //
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800]),
                        child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: const Text(
                              'Send code',
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SignInScreen()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Remember password?",
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Sign in',
                      style: TextStyle(fontSize: 14.0),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ]),
          )),
    );
  }
}
