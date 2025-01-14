import 'package:category/core/widget/custom_text_field.dart';
import 'package:category/core/widget/validate.dart';
import 'package:category/features/auth/view/auth_register_screen.dart';
import 'package:category/features/home/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 30, wordSpacing: 1),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
                icon: Icons.email,
                label: "email",
                hint: "email",
                controller: emailController,
                validator: (value) {
                  MyValidators.emailValidator(value);
                },
                onTap: () {
                  emailController.clear();
                }),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
                icon: Icons.password,
                label: "password",
                hint: "password",
                controller: passwordController,
                validator: (value) {
                  MyValidators.passwordValidator(value);
                },
                onTap: () {
                  passwordController.clear();
                }),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.indigo),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                child: const Text(
                  "login",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do not have an account?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AuthRegisterScreen(),));
                }, child: Text("Sign up")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
