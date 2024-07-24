import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_clean/src/features/user/domain/entities/user.dart';
import 'package:mvvm_clean/src/features/user/domain/usecases/get_user.dart';

class UserProfileViewModel extends StateNotifier<AsyncValue<User>> {
  final GetUser getUser;

  UserProfileViewModel(this.getUser) : super(const AsyncValue.loading());

  Future<void> loadUser(int id) async {
    state = const AsyncValue.loading();
    final result = await getUser(Params(id: id));
    state = result.fold(
      (failure) => AsyncValue.error(failure, StackTrace.current),
      (user) => AsyncValue.data(user),
    );
  }
}
