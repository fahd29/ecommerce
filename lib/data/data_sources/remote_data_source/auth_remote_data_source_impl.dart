import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_manager.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/data/end_points.dart';
import 'package:ecommerce_app/data/model/RegisterResponseDto.dart';
import 'package:ecommerce_app/domain/entity/AuthResponseEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, AuthResponseDto>> register(String name, String email, String password, String rePassword, String phone) async{
    try{
      var response=await apiManager.postData(EndPoints.register,body: {
        "name": name,
        "email":email,
        "password":password,
        "rePassword":rePassword,
        "phone":phone
      });
      var registerResponse=AuthResponseDto.fromJson(response.data);
      if(response.statusCode!>=200&&response.statusCode!<300){
        return right(registerResponse);
      }else{
        return Left(ServerError(errorMessage: registerResponse.message!));
      }

    }catch(error){
      return Left(Failures(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failures, AuthResponseEntity>> login(String email, String password)async {
    try{
      var response=await apiManager.postData(EndPoints.login,body: {
        "email":email,
        "password":password,
      });
      var loginResponse=AuthResponseDto.fromJson(response.data);
      if(response.statusCode!>=200&&response.statusCode!<300){
        return right(loginResponse);
      }else{
        return Left(ServerError(errorMessage: loginResponse.message!));
      }

    }catch(error){
      return Left(Failures(errorMessage: error.toString()));
    }
  }
}