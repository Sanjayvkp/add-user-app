import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_app/core/utils/image_picker_utils.dart';

final imageProvider = StateProvider<XFile?>((ref) {
  return null;
});

class ImagePickerWidget extends ConsumerWidget {
  const ImagePickerWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Path of the image picked
    final imagePathPicked = ref.watch(imageProvider)?.path;

    /// Image to show if the image is already picked
    Widget? imageToShow;

    if (imagePathPicked != null && imagePathPicked.startsWith('http')) {
      imageToShow = Image.network(
        imagePathPicked,
        fit: BoxFit.cover,
      );
    } else if (imagePathPicked != null) {
      imageToShow = Image.file(
        File(imagePathPicked),
        fit: BoxFit.cover,
      );
    }

    return InkWell(
      onTap: () async {
        final imageSelected =
            await ImagePickerUtils.showDialogueForImagePicker(context);
        ref.read(imageProvider.notifier).state = imageSelected;
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: imageToShow ??
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
      ),
    );
  }
}
