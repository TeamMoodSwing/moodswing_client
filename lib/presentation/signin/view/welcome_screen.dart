import 'package:flutter/material.dart';
import 'package:moodswing_client/presentation/common/layout/default_layout.dart';
import 'package:moodswing_client/presentation/signin/view/signin_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      //margin: const EdgeInsets.only(top: 50),
                      alignment: Alignment.centerLeft,
                      child: const Text("Welcome!",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700))),
                  Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'asset/logo/smile_logo.png',
                        width: 32,
                      )),
                ],
              ),
              const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                  child: Text(
                    'Your account is set up',
                    style: TextStyle(fontSize: 16),
                  )),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => SignInScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800]),
                        child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
