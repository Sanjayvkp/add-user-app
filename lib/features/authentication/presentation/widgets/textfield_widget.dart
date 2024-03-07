import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextfieldWidget extends ConsumerWidget {
  final String hintText;
  final Icon icondata;
  final TextEditingController controller;
  final TextInputType keyboardtype;
  const TextfieldWidget(
      {super.key,
      required this.hintText,
      required this.icondata,
      required this.controller,
      required this.keyboardtype});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: TextField(
        keyboardType: keyboardtype,
        autofocus: false,
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 24),
            hintText: hintText,
            prefixIcon: icondata,
            iconColor: Colors.black,
            hintStyle: const TextStyle(color: Colors.black),
            fillColor: Colors.grey,
            filled: true,
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
