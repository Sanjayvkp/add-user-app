import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_app/core/exceptions/base_exception.dart';

class ImagePickerUtils {
  static Future<XFile?> pickImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      return pickedImage;
    } else {
      Future.sync(() => BaseException('No image picked'));
      return null;
    }
  }

  static Future<XFile?> pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return pickedImage;
    } else {
      Future.sync(
        () => BaseException('no image picked'),
      );
      return null;
    }
  }

  static Future<XFile?> showDialogueForImagePicker(
    BuildContext context, [
    bool showDeleteOption = false,
  ]) async {
    final imageCompleter = Completer<XFile?>();
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Consumer(
            builder: (context, ref, child) {
              return Column(
                children: [
                  TextButton(
                      onPressed: () async {
                        imageCompleter.complete(
                            await ImagePickerUtils.pickImageFromCamera(
                                context));
                        Future.sync(() => Navigator.pop(context));
                      },
                      child: const Text(
                        'camera',
                      )),
                  TextButton(
                      onPressed: () async {
                        imageCompleter.complete(
                          await ImagePickerUtils.pickImageFromGallery(context),
                        );
                        Future.sync(() => Navigator.pop(context));
                      },
                      child: const Text(
                        'Gallery',
                      )),

                  /// Show the delete option if required
                  if (showDeleteOption)
                    TextButton(
                        onPressed: () async {
                          /// An empty path is given to remove the selected image
                          imageCompleter.complete(
                            XFile(''),
                          );
                          Future.sync(() => Navigator.pop(context));
                        },
                        child: const Text('delete')),
                ],
              );
            },
          ),
        );
      },
    );

    final imageSelected = await (imageCompleter.future);
    return imageSelected;
  }
}
