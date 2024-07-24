import 'package:dartz/dartz.dart';
import 'package:mvvm_clean/src/core/error/failures.dart';
import 'package:mvvm_clean/src/core/usecases/usecase.dart';
import 'package:mvvm_clean/src/features/user/domain/entities/user.dart';
import 'package:mvvm_clean/src/features/user/domain/repositories/user_repository.dart';

class GetUser implements UseCase<User, Params> {
  final UserRepository repository;

  GetUser(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.getUser(params.id);
  }
}

class Params {
  final int id;
  Params({required this.id});
}
