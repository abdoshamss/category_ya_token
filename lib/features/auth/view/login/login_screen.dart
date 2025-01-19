import 'package:category/core/widget/custom_text_field.dart';
import 'package:category/core/widget/validate.dart';
import 'package:category/features/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';
import '../register/auth_register_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            if (state.userData["status"] == "success") {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(state.userData["message"])));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>   const Layout(),
                  ));
            }
            if (state.userData["status"] == "error") {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.userData["message"])));
            }
          }
        },
        builder: (context, state) {
          AuthCubit cubit = BlocProvider.of(context);
          return Scaffold(
            body: Form(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          wordSpacing: 1),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                        icon: Icons.email,
                        label: "email",
                        hint: "",
                        controller: emailController,
                        validator: (value) {
                          MyValidators.emailValidator(value);
                          return null;
                        },
                        onTap: () {
                          emailController.clear();
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      obscureText: true,
                        icon: Icons.password,
                        label: "password",
                        hint: "",
                        controller: passwordController,
                        validator: (value) {
                          MyValidators.passwordValidator(value);
                          return null;
                        },
                        onTap: () {
                          passwordController.clear();
                        }),
                    const SizedBox(
                      height: 40,
                    ),
                    if (state is AuthSuccessState)
                      const CircularProgressIndicator(),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.indigo),
                        ),
                        onPressed: () {
                          cubit.loginCubit(
                              email: emailController.text,
                              password: passwordController.text);
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
                        const Text(
                          "Do not have an account?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AuthRegisterScreen(),
                                  ));
                            },
                            child: const Text("Sign up")),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
