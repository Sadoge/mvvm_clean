import 'package:dartz/dartz.dart';
import 'package:mvvm_clean/src/core/error/exceptions.dart';
import 'package:mvvm_clean/src/core/error/failures.dart';
import 'package:mvvm_clean/src/features/user/data/datasources/user_remote_data_source.dart';
import 'package:mvvm_clean/src/features/user/domain/entities/user.dart';
import 'package:mvvm_clean/src/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> getUser(int id) async {
    try {
      final remoteUser = await remoteDataSource.getUser(id);
      return Right(remoteUser);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
