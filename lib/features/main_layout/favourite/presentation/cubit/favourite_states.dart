import 'package:ecommerce_app/domain/entity/AddProductToWishListEntity.dart';
import 'package:ecommerce_app/domain/entity/GetLoggedUserWashListEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class FavouriteStates{}
class FavouriteInitState extends FavouriteStates{}
class FavouriteLoadingState extends FavouriteStates{}
class FavouriteErrorState extends FavouriteStates{
  Failures failures;
  FavouriteErrorState({required this.failures});
}
class FavouriteSuccessState extends FavouriteStates{
  GetLoggedUserWashListEntity getLoggedEntity;
  FavouriteSuccessState({required this.getLoggedEntity});
}
class FavouriteDeleteErrorState extends FavouriteStates{
  Failures failures;
  FavouriteDeleteErrorState({required this.failures});
}
class FavouriteDeleteSuccessState extends FavouriteStates{
  AddProductToWishListEntity addToWishListEntity;
  FavouriteDeleteSuccessState({required this.addToWishListEntity});
}