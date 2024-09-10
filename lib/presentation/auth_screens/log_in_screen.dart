import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/signUpProvider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
            // Name textfield
            // TextField(
            //   controller: nameController,
            //   decoration: InputDecoration(
            //     hintText: "Enter NAME",
            //   ),
            // ),

            // Email textfield
            TextField(
              controller: emailController,
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
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            // Password textfield
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
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
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forget Password?",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),

            Consumer<AuthProvider>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () async {
                    await value.logIn(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(05)),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.white, // Color of the line
                    thickness: 2, // Thickness of the line
                    endIndent: 10, // Space between the line and the text
                  ),
                ),
                Text(
                  'or',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white, // Color of the line
                    thickness: 2, // Thickness of the line
                    indent: 10, // Space between the text and the line
                  ),
                ),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            // apple button
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.2),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/createScreen/apl.png"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  const Text(
                    "Continue with Apple",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            // google button
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.2),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/createScreen/google.png"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  const Text(
                    "Continue with Google",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),

            Align(
              alignment: Alignment.center,
              child: RichText(
                text: const TextSpan(
                  text: 'Don’t have an Account? ', // Regular text
                  style: TextStyle(
                    color: Colors.white, // Color of the regular text
                    fontSize: 16.0, // Font size of the regular text
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign Up', // Bold text
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Bold font weight
                        color:
                            Colors.white, // Color of the bold text (optional)
                        fontSize: 16.0, // Font size of the bold text
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
