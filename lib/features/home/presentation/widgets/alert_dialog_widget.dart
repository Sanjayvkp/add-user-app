import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const AlertDialogWidget(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
            onPressed: onPressed,
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.black),
            )),
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'No',
              style: TextStyle(color: Colors.black),
            )),
      ],
    );
  }
}
