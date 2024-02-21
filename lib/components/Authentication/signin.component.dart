import 'package:autogpt/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController mobileNumberController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(flex: 2, child: SizedBox()),
            Expanded(
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Enter Your Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: (value) {
                  nameController.text = value;
                },
              ),
            ),
            Expanded(
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Enter your email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.outlined_flag_sharp),
                ),
                onChanged: (value) {
                  emailController.text = value;
                },
              ),
            ),
            Expanded(
              child: TextField(
                controller: mobileNumberController,
                decoration: const InputDecoration(
                  labelText: "+91-XXXX-XX-XXXX",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.outlined_flag_sharp),
                ),
                onChanged: (value) {
                  mobileNumberController.text = value;
                },
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ELEVATED_BUTTON_COLOR,
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Log In"),
              ),
            ),
            const Expanded(flex: 2, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
