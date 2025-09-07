import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_manager.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/get_logged_user_wash_list_ds.dart';
import 'package:ecommerce_app/data/end_points.dart';
import 'package:ecommerce_app/data/model/GetLoggedUserWashListDto.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/features/auth/presentation/login/shared_prefs_utils.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:GetLoggedUserWishListDs )
class GetLoggedWashListDsImpl implements GetLoggedUserWishListDs{
  ApiManager apiManager;
  GetLoggedWashListDsImpl({required this.apiManager});
  @override
  Future<Either<Failures, GetLoggedUserWashListDto>> getLogged()async {
    try{
      var token=SharedPrefsUtils.getData(key: 'token');
      var response=await apiManager.getData(EndPoints.wishList,
          headers: {
            //nullable obj
            'token':token.toString()
          }

      );
      var getLoggedResponse=GetLoggedUserWashListDto.fromJson(response.data);
      if(response.statusCode!>=200&&response.statusCode!<300){
        return right(  getLoggedResponse);
      }else{
        return Left(ServerError(errorMessage:  getLoggedResponse.message!));
      }

    }catch(error){
      return Left(Failures(errorMessage: error.toString()));
    }
  }
  }
