import 'package:flutter/material.dart';
import 'package:moodswing_client/presentation/common/widgets/custom_text.dart';
import 'package:moodswing_client/presentation/common/widgets/custom_text_form_field.dart';
import 'package:moodswing_client/presentation/common/layout/default_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: SafeArea(
      top: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(children: [
            const SizedBox(height: 50),
            const Icon(
              Icons.square,
              size: 130,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 50),
            CustomTextFormField(
              onChanged: (p0) {},
              hintText: 'Email',
            ),
            CustomTextFormField(
              onChanged: (p0) {},
              hintText: 'Password',
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {}, child: CustomText(text: '회원가입')),
                Text('/'),
                TextButton(
                  onPressed: () {},
                  child: CustomText(text: '비밀번호 찾기'),
                )
              ],
            ),
            const SizedBox(height: 50),
            const Row(
              children: [
                SizedBox(
                    width: 140,
                    child:
                        Divider(height: 2, color: Colors.grey, endIndent: 10)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Social Login',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                    width: 140,
                    child: Divider(height: 2, color: Colors.grey, indent: 10))
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(backgroundColor: Colors.yellow),
                    CircleAvatar(backgroundColor: Colors.green),
                    CircleAvatar(backgroundColor: Colors.red),
                    CircleAvatar(backgroundColor: Colors.black)
                  ]),
            )
          ]),
        ),
      ),
    ));
  }
}
