import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/features/authentication/presentation/providers/auth_provider.dart';
import 'package:user_app/features/home/presentation/providers/user_provider.dart';
import 'package:user_app/features/home/presentation/widgets/show_dialog_widget.dart';
import 'package:user_app/features/home/presentation/widgets/user_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'User App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () =>
                  ref.read(authenticationProvider.notifier).signOut(context),
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: Colors.black,
      body: switch (ref.watch(getAllusersProvider)) {
        AsyncData(:final value) => SizedBox(
            child: UserWidget(entity: value),
          ),
        AsyncError() => const Center(
            child: Text('Error while getting data'),
          ),
        _ => const Center(
            child: CircularProgressIndicator(),
          )
      },
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const ShowDialogWidget();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
