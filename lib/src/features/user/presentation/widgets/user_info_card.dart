import 'package:flutter/material.dart';
import 'package:mvvm_clean/src/features/user/domain/entities/user.dart';

class UserInfoCard extends StatelessWidget {
  final User user;

  const UserInfoCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(user.name, style: Theme.of(context).textTheme.titleLarge),
            Text(user.email),
          ],
        ),
      ),
    );
  }
}
