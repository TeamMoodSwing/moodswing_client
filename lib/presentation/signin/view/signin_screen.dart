import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moodswing_client/data/strings.dart';
import 'package:moodswing_client/env/api.dart';
import 'package:moodswing_client/presentation/common/style/dimension.dart';
import 'package:moodswing_client/presentation/common/widgets/custom_social_options.dart';
import 'package:moodswing_client/presentation/common/widgets/custom_text.dart';
import 'package:moodswing_client/presentation/common/widgets/custom_text_form_field.dart';
import 'package:moodswing_client/presentation/common/layout/default_layout.dart';
import 'package:moodswing_client/presentation/home/view/home_screen.dart';
import 'package:moodswing_client/presentation/signin/view/forgot_password_screen.dart';
import 'package:moodswing_client/presentation/signin/view/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  final bool checked;

  const SignInScreen({this.checked = false, super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool? rememberMe = false;
  String useremail = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    return DefaultLayout(
        child: SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            const SizedBox(height: 50),
            Container(
                width: 180,
                height: 180,
                color: Colors.white,
                child: Image.asset('asset/logo/smile_logo.png')),
            const SizedBox(height: 50),
            CustomTextFormField(
              onChanged: (String val) {
                useremail = val;
              },
              hintText: 'Email',
            ),
            CustomTextFormField(
              onChanged: (val) {
                password = val;
              },
              hintText: 'Password',
            ),

            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Expanded(
                child: SizedBox(
                  child: CheckboxListTile(
                      contentPadding: const EdgeInsets.all(0),
                      controlAffinity: ListTileControlAffinity.leading,
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                      title: const CustomText(
                        text: 'Remember me',
                        color: Colors.grey,
                      ),
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value;
                        });
                      }),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ForgotPasswordScreen(),
                    ));
                  },
                  child: const CustomText(
                      text: 'Forgot password?', color: Colors.grey))
            ]),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      //TODO
                      final rawString = '$useremail:$password';

                      Codec<String, String> stringToBase64 = utf8.fuse(base64);

                      String token = stringToBase64.encode(rawString);

                      final resp = await dio.post('http://$ip/auth/login',
                          options: Options(headers: {
                            'authourization': 'Basic $token',
                          }));

                      final refreshToken = resp.data['refreshToken'];
                      final accessToken = resp.data['accessToken'];

                      await storage.write(
                          key: REFRESH_TOKEN_KEY, value: refreshToken);
                      await storage.write(
                          key: ACCESS_TOKEN_KEY, value: accessToken);

                      //로그인 성공했으면 홈으로
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => HomeScreen()));

                      //print(resp.data);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[800]),
                    child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: const CustomText(
                          text: 'Login',
                          fontSize: 24,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SignUpScreen()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: "Don't have an account?"),
                      SizedBox(
                        width: 10,
                      ),
                      CustomText(text: 'Sign up')
                    ]),
              ),
            ),

            _dividerWithText(),
            //TODO
            const CustomSocialOptions()
          ]),
        ),
      ),
    ));
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
          child: CustomText(text: 'Or Login With', color: Colors.grey),
        ),
        SizedBox(
            width: 100,
            child: Divider(height: 2, color: Colors.grey, indent: 10))
      ],
    );
  }
}
