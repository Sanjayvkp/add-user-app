import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:user_app/features/authentication/presentation/providers/auth_provider.dart';
import 'package:user_app/features/authentication/presentation/widgets/login_button_widget.dart';

class LogInPage extends HookConsumerWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(authenticationProvider.notifier);
    final phonenumberController = useTextEditingController();

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
                color: Colors.amber,
                size: 65,
              ),
              const Text(
                'Login Now',
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 40,
              ),
              IntlPhoneField(
                flagsButtonPadding: const EdgeInsets.all(8),
                dropdownIconPosition: IconPosition.trailing,
                showCountryFlag: false,
                decoration: const InputDecoration(
                  fillColor: Colors.grey,
                  filled: true,
                  hintText: 'Phone number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  phonenumberController.text = phone.completeNumber;
                },
              ),
              const SizedBox(
                height: 32,
              ),
              LoginButtonWidget(
                btntxt: 'Send OTP',
                onPressed: () {
                  data.signInWithPhone(context, phonenumberController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
