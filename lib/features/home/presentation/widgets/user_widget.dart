import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/features/home/domain/entities/user_entity.dart';
import 'package:user_app/features/home/presentation/providers/user_provider.dart';

class UserWidget extends ConsumerWidget {
  final List<UserEntity> entity;
  const UserWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: entity.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Card(
            color: const Color.fromARGB(255, 23, 23, 23),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person_2_outlined),
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
                    ref
                        .read(userProvider.notifier)
                        .deleteUser(entity[index].id);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            ),
          ),
        );
      },
    );
  }
}
