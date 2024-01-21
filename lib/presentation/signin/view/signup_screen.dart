import 'package:flutter/material.dart';
import 'package:moodswing_client/presentation/common/layout/default_layout.dart';
import 'package:moodswing_client/presentation/common/widgets/custom_social_options.dart';
import 'package:moodswing_client/presentation/common/widgets/custom_text.dart';
import 'package:moodswing_client/presentation/common/widgets/custom_text_form_field.dart';
import 'package:moodswing_client/presentation/signin/view/signin_screen.dart';
import 'package:moodswing_client/presentation/signin/view/welcome_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTEC = TextEditingController();
  TextEditingController emailTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();
  TextEditingController confirmPwdTEC = TextEditingController();

  bool isVerified = false;
  String username = '';
  String useremail = '';
  String password = '';
  String confrimPassword = '';
  String errorText = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameTEC.dispose();
    emailTEC.dispose();
    passwordTEC.dispose();
    confirmPwdTEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: SafeArea(
                top: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(children: [
                    const CustomText(
                      text: 'Sign Up',
                      padding: EdgeInsets.only(left: 4),
                      margin: EdgeInsets.symmetric(vertical: 50),
                      alignment: Alignment.centerLeft,
                      fontSize: 30,
                      isBold: true,
                    ),
                    _inputFormArea(),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => WelcomeScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[800]),
                            child: Container(
                                height: 50,
                                alignment: Alignment.center,
                                child: const CustomText(
                                  text: 'Create',
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => SignInScreen()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: "Already have an account?",
                              color: Colors.grey),
                          SizedBox(
                            width: 10,
                          ),
                          CustomText(text: 'Sign In')
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    _dividerWithText(),
                    //TODO
                    const CustomSocialOptions()
                  ]),
                ))));
  }

  Widget _inputFormArea() {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'Name',
          textEditinContorller: nameTEC,
          onChanged: (p0) {
            username = nameTEC.text;
          },
        ),
        //email with verify
        Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: CustomTextFormField(
                onChanged: (p0) {
                  useremail = emailTEC.text;
                },
                hintText: 'Email',
                textEditinContorller: emailTEC,
                showSufixIcon: true,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 6.0),
                child: ElevatedButton(
                    onPressed: () {
                      //
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(8.0),
                        backgroundColor: Colors.grey[400]),
                    child: const CustomText(
                      text: 'Verify',
                      isBold: true,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      fontSize: 16,
                    )),
              ),
            )
          ],
        ),
        CustomTextFormField(
          onChanged: (p0) {
            password = passwordTEC.text;
          },
          hintText: 'Password',
          textEditinContorller: passwordTEC,
        ),
        CustomTextFormField(
          onChanged: (p0) {
            confrimPassword = confirmPwdTEC.text;
          },
          hintText: 'Confirm password',
          textEditinContorller: confirmPwdTEC,
        ),
      ],
    );
  }

  Widget _dividerWithText() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 100,
            child: Divider(height: 2, color: Colors.grey, endIndent: 10)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: CustomText(text: 'Or Register With', color: Colors.grey),
        ),
        SizedBox(
            width: 100,
            child: Divider(height: 2, color: Colors.grey, indent: 10))
      ],
    );
  }
}
