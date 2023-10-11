import 'package:final_project/screens/login_screen.dart';
import 'package:final_project/utils/bold_text.dart';
import 'package:final_project/utils/normal_text.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 100,
            ),
            Image.network(
                "https://m.media-amazon.com/images/I/61YxGFEPjfL._AC_UF1000,1000_QL80_.jpg"),
            const SizedBox(
              height: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                NormalText(
                  text: 'Welcome to Fall Detection App!',
                  color: Colors.blue,
                  size: 22,
                ),
                SizedBox(
                  height: 5,
                ),
                BoldText(text: 'Get an instant', color: Colors.black, size: 35),
                BoldText(
                    text: 'Notification when,', color: Colors.black, size: 35),
                BoldText(
                    text: 'a fall is detected.', color: Colors.black, size: 35),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              },
              child: const NormalText(
                text: 'Continue',
                color: Colors.white,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
