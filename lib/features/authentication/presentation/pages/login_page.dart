import 'package:flutter/material.dart';
import 'package:user_app/features/authentication/presentation/pages/otp_verification_page.dart';
import 'package:user_app/features/authentication/presentation/widgets/login_button_widget.dart';
import 'package:user_app/features/authentication/presentation/widgets/textfield_widget.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.supervisor_account_outlined,
                color: Color.fromARGB(255, 214, 14, 0),
                size: 65,
              ),
              const Text(
                'Login Now',
                style: TextStyle(
                    color: Color.fromARGB(255, 214, 14, 0),
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 40,
              ),
              TextfieldWidget(
                hintText: 'Phone number',
                icondata: const Icon(Icons.phone),
                controller: TextEditingController(),
                keyboardtype: TextInputType.number,
              ),
              const SizedBox(
                height: 32,
              ),
              LoginButtonWidget(
                btntxt: 'Send OTP',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OtpVerificationPage(),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
