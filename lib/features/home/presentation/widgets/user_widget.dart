import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:user_app/features/home/domain/entities/user_entity.dart';
import 'package:user_app/features/home/presentation/providers/user_provider.dart';
import 'package:user_app/features/home/presentation/widgets/alert_dialog_widget.dart';

class UserWidget extends HookConsumerWidget {
  final List<UserEntity> entity;
  const UserWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final ScrollController scrollController = useScrollController();

    // useEffect(() {
    //   final listener =
    //   scrollController.addListener(() { })

    //   return null;
    // }, []);

    final isLoading =
        ref.watch(userProvider.select((value) => value.isLoading));

    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.extentAfter < 30) {
          ref.read(userProvider.notifier).changeLoading(true);
          ref.read(getAllusersProvider(10, entity.last.id));
        }

        return true;
      },
      child: ListView.builder(
        // controller: scrollController,
        itemCount: entity.length + 1,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == entity.length) {
            return isLoading
                ? const SizedBox(
                    height: 40,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              color: const Color.fromARGB(255, 23, 23, 23),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(entity[index].imagePath),
                ),
                title: Text(
                  entity[index].name,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  entity[index].age,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialogWidget(
                              title: 'Are you Sure want to delete this user?',
                              onPressed: () {
                                ref
                                    .read(userProvider.notifier)
                                    .deleteUser(entity[index].id);
                                Navigator.pop(context);
                              });
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
