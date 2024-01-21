import 'package:flutter/material.dart';

class CustomSocialOptions extends StatelessWidget {
  const CustomSocialOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        GestureDetector(
            onTap: () {},
            child:
                CircleAvatar(child: Image.asset('asset/Icons/sns_kakao.png'))),
        GestureDetector(
            onTap: () {},
            child:
                CircleAvatar(child: Image.asset('asset/Icons/sns_apple.png'))),
        GestureDetector(
            onTap: () {},
            child:
                CircleAvatar(child: Image.asset('asset/Icons/sns_google.png'))),
        GestureDetector(
            onTap: () {},
            child:
                CircleAvatar(child: Image.asset('asset/Icons/sns_naver.png'))),
      ]),
    );
  }
}
