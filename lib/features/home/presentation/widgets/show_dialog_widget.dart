import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/features/home/presentation/providers/user_provider.dart';

class ShowDialogWidget extends ConsumerWidget {
  const ShowDialogWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(userProvider.notifier);
    return AlertDialog(
        title: const Text('Enter Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: data.nameController,
              decoration: const InputDecoration(hintText: 'Username'),
            ),
            TextField(
              controller: data.ageController,
              decoration: const InputDecoration(hintText: 'Age'),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(userProvider.notifier).addUser(
                      name: data.nameController.text,
                      age: data.ageController.text,
                      id: '');
                  Navigator.pop(context);
                  data.nameController.clear();
                  data.ageController.clear();
                },
                child: const Text('Add')),
          ],
        ));
  }
}
