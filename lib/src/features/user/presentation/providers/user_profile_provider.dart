import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_clean/src/features/user/data/datasources/user_remote_data_source.dart';
import 'package:mvvm_clean/src/features/user/data/repositories/user_repository_impl.dart';
import 'package:mvvm_clean/src/features/user/domain/entities/user.dart';
import 'package:mvvm_clean/src/features/user/domain/repositories/user_repository.dart';
import 'package:mvvm_clean/src/features/user/domain/usecases/get_user.dart';
import 'package:mvvm_clean/src/features/user/presentation/viewmodels/user_profile_view_model.dart';
import 'package:http/http.dart' as http;

final userProfileViewModelProvider =
    StateNotifierProvider<UserProfileViewModel, AsyncValue<User>>((ref) {
  final getUser = ref.watch(getUserProvider);
  return UserProfileViewModel(getUser);
});

final getUserProvider = Provider<GetUser>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return GetUser(repository);
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final remoteDataSource = ref.watch(userRemoteDataSourceProvider);
  return UserRepositoryImpl(remoteDataSource: remoteDataSource);
});

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  return UserRemoteDataSourceImpl(client: http.Client());
});
