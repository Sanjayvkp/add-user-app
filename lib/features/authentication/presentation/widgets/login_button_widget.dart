import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginButtonWidget extends ConsumerWidget {
  final String btntxt;
  final void Function()? onPressed;
  const LoginButtonWidget(
      {super.key, required this.btntxt, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 52, 52, 52),
            minimumSize: Size(MediaQuery.sizeOf(context).width / 1.1,
                MediaQuery.sizeOf(context).height / 13),
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: onPressed,
        child: Text(
          btntxt,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ));
  }
}
