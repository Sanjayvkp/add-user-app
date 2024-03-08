import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/features/home/presentation/providers/user_provider.dart';
import 'package:user_app/features/home/presentation/widgets/image_picker_widget.dart';

class ShowDialogWidget extends HookConsumerWidget {
  const ShowDialogWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final ageController = useTextEditingController();

    return AlertDialog(
        backgroundColor: Colors.amber,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
        title: const Text(
          'Enter Details',
          style: TextStyle(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ImagePickerWidget(),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Username'),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(hintText: 'Age'),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  ref.read(userProvider.notifier).addUser(
                      imagePath: ref.watch(imageProvider)!.path,
                      name: nameController.text,
                      age: ageController.text,
                      id: '');
                  ref.read(imageProvider.notifier).state = null;
                  Navigator.pop(context);
                },
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ));
  }
}
