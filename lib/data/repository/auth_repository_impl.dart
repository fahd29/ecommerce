import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/domain/entity/AuthResponseEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:AuthRepository )
class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failures, AuthResponseEntity>> register(String name, String email, String password, String rePassword, String phone) async{
    var either=await authRemoteDataSource.register(name, email, password, rePassword, phone);
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

  @override
  Future<Either<Failures, AuthResponseEntity>> login(String email, String password)async {
    var either=await authRemoteDataSource.login(email, password);
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }
}