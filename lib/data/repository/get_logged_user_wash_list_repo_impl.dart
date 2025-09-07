import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/get_logged_user_wash_list_ds.dart';
import 'package:ecommerce_app/domain/entity/GetLoggedUserWashListEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/get_logged_user_watch_list_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: GetLoggedUserWashListRepo)
class GetLoggedUserWashListRepoImpl implements GetLoggedUserWashListRepo{
  GetLoggedUserWishListDs getLoggedUserWishListDs;
  GetLoggedUserWashListRepoImpl({required this.getLoggedUserWishListDs});
  @override
  Future<Either<Failures, GetLoggedUserWashListEntity>> getLogged() async{
   var either=await getLoggedUserWishListDs.getLogged();
   return either.fold((error)=>Left(error), (response)=>right(response));
  }

}