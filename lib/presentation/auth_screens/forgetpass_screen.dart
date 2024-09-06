import 'package:flutter/material.dart';

class ForgetpassScreen extends StatefulWidget {
  const ForgetpassScreen({super.key});

  @override
  State<ForgetpassScreen> createState() => _ForgetpassScreenState();
}

class _ForgetpassScreenState extends State<ForgetpassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: Image.asset(
          "assets/B_logo.png",
          height: MediaQuery.of(context).size.height * 0.04,
          // width: MediaQuery.of(context).size.width * 0.09,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 14.0,
          left: 14.0,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Back!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Happy to see you again. Enter your Email and Password",
              style:
                  TextStyle(color: Colors.white.withOpacity(.6), fontSize: 16),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextField(
              // controller: emailController,
              decoration: InputDecoration(
                hintText: "E-mail",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    color: Colors
                        .white, // Change this to your desired focused border color
                    width:
                        2.0, // You can adjust the width of the border as needed
                  ),
                ),
              ),
              style: const TextStyle(
                color: Colors.white, // Change this to your desired text color
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(05)),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    'Send OTP',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
