import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/features/authentication/presentation/providers/auth_provider.dart';
import 'package:user_app/features/authentication/presentation/widgets/login_button_widget.dart';
import 'package:user_app/features/authentication/presentation/widgets/textfield_widget.dart';

class OtpVerificationPage extends HookConsumerWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(authenticationProvider.notifier);
    final otpController = useTextEditingController();
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
                    color: Colors.amber,
                    size: 65,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextfieldWidget(
                    keyboardtype: TextInputType.number,
                    hintText: 'Enter Otp',
                    icondata: const Icon(Icons.lock_clock_rounded),
                    controller: otpController,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  LoginButtonWidget(
                    btntxt: 'Confirm Otp',
                    onPressed: () {
                      data.verifyOtp(context, otpController.text);
                    },
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
