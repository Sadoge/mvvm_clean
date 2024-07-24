import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_clean/src/features/user/presentation/providers/user_profile_provider.dart';
import 'package:mvvm_clean/src/features/user/presentation/widgets/user_info_card.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(userProfileViewModelProvider.notifier);
    final userState = ref.watch(userProfileViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: Center(
        child: userState.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
          data: (user) => UserInfoCard(user: user),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.loadUser(1),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
