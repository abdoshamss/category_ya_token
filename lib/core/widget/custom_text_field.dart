import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final Widget? imageIcon;
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool? obscureText;
  final void Function() onTap;

  const CustomTextField(
      {super.key,
      required this.icon,
      required this.label,
      required this.hint,
      required this.controller,
      required this.validator,  this.obscureText, required this.onTap, this.imageIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText??false,
      controller: controller,
      validator: validator,
      style: const TextStyle(fontWeight: FontWeight.bold),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(icon,color: Colors.indigo,),
          ),
          suffixIcon: imageIcon,
          suffix: InkWell(onTap: onTap, child: const Icon(Icons.cancel,color: Colors.red,)),
          label: Text(label),
          labelStyle: const TextStyle(color: Colors.grey),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 5, color: Colors.indigo)),
          focusedBorder: border(color: Colors.red, radius: 20),),
    );
  }

  InputBorder border({required color, required double radius}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(color: color));
  }
}
