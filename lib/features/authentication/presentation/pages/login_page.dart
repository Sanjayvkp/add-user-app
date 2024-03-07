import 'package:flutter/material.dart';
import 'package:user_app/features/authentication/presentation/widgets/textfield_widget.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextfieldWidget(
                labeltext: 'Phone number',
                icondata: Icon(Icons.phone),
                controller: TextEditingController(),
                keyboardtype: TextInputType.number),
          ],
        ),
      ),
    );
  }
}
