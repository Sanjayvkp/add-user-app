import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/features/authentication/presentation/providers/auth_provider.dart';
import 'package:user_app/features/home/presentation/providers/user_provider.dart';
import 'package:user_app/features/home/presentation/widgets/alert_dialog_widget.dart';
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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialogWidget(
                      title: 'Are you Sure want to logout?',
                      onPressed: () => ref
                          .read(authenticationProvider.notifier)
                          .signOut(context),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: Colors.black,
      body: Consumer(builder: (context, ref, child) {
        final users = ref.watch(userProvider);

        if (users.users == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SizedBox(
            child: UserWidget(entity: users.users!),
          );
        }
      }),
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
