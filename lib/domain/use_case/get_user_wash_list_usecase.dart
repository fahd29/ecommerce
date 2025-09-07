import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entity/GetLoggedUserWashListEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/get_logged_user_watch_list_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetLoggedUserWashListUseCase{
  GetLoggedUserWashListRepo getLoggedUserWashListRepo;
  GetLoggedUserWashListUseCase({required this.getLoggedUserWashListRepo});
  Future<Either<Failures,GetLoggedUserWashListEntity>>invoke(){
    return getLoggedUserWashListRepo.getLogged();
  }
}