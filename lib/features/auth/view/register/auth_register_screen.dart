import 'package:category/core/widget/app_bar.dart';
import 'package:category/core/widget/custom_text_field.dart';
import 'package:category/core/widget/gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/validate.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';
import '../login/login_screen.dart';

class AuthRegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();
  final TextEditingController repeatController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  AuthRegisterScreen({super.key});

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
                    builder: (context) => LoginScreen(),
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
            appBar: appBar(
                title: "Sign Up",
                icon: Icons.arrow_back_ios,
                onPressed: () {
                  Navigator.pop(context);
                }),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 2),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 7,
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                cubit.image != null
                                    ? " Uploaded"
                                    : " upload your profile image",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: cubit.image != null
                                        ? Colors.black
                                        : Colors.red),
                              ),
                            ),
                            const Spacer(),
                            cubit.image == null
                                ? MaterialButton(
                                    onPressed: () {
                                      cubit.addImage();
                                    },
                                    child: const Icon(
                                      Icons.camera_alt,
                                      size: 35,
                                      color: Colors.red,
                                    ))
                                : Container(
                                    height: 70,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: FileImage(cubit.image!),
                                        fit: BoxFit.fill,
                                      ),
                                    )),
                          ],
                        ),
                      ),
                    ),
                    CustomTextField(
                      icon: Icons.person,
                      label: 'name',
                      hint: '',
                      controller: nameController,
                      validator: (value) {
                        return MyValidators.displayNameValidator(value);
                      },
                      onTap: () {
                        nameController.clear();
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      icon: Icons.email,
                      label: 'email',
                      hint: '',
                      controller: emailController,
                      validator: (value) {
                        return MyValidators.emailValidator(value);
                      },
                      onTap: () {
                        emailController.clear();
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      obscureText: true,
                      icon: Icons.password,
                      label: 'password',
                      hint: '',
                      controller: passwordController,
                      validator: (value) {
                        return MyValidators.passwordValidator(value);
                      },
                      onTap: () {
                        passwordController.clear();
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      obscureText: true,
                      icon: Icons.password,
                      label: 'repeat password',
                      hint: '',
                      controller: repeatController,
                      validator: (value) {
                        return MyValidators.repeatPasswordValidator();
                      },
                      onTap: () {
                        repeatController.clear();
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      icon: Icons.perm_identity,
                      label: 'nationality',
                      hint: '',
                      controller: nationalityController,
                      validator: (value) {
                        return MyValidators.nationalIdValidator(value);
                      },
                      onTap: () {
                        nationalityController.clear();
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      icon: Icons.phone,
                      label: 'phone',
                      hint: '',
                      controller: phoneController,
                      validator: (value) {
                        return MyValidators.phoneValidator(value);
                      },
                      onTap: () {
                        phoneController.clear();
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GenderSelection(genderController: genderController),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.indigo),
                        ),
                        onPressed: () {
                          cubit.postDataCubit(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              nationalId: nationalityController.text,
                              password: passwordController.text,
                              token: tokenController.text,
                              gender: genderController.text);
                        },
                        child: const Text(
                          "sign up",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
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
