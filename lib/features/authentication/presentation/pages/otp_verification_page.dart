import 'package:flutter/material.dart';
import 'package:user_app/features/authentication/presentation/widgets/login_button_widget.dart';
import 'package:user_app/features/authentication/presentation/widgets/textfield_widget.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Icon(
                    Icons.supervisor_account_outlined,
                    color: Color.fromARGB(255, 214, 14, 0),
                    size: 65,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextfieldWidget(
                      keyboardtype: TextInputType.number,
                      hintText: 'Enter Otp',
                      icondata: const Icon(Icons.lock_clock_rounded),
                      controller: TextEditingController()),
                  const SizedBox(
                    height: 32,
                  ),
                  LoginButtonWidget(
                    btntxt: 'Confirm Otp',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
