import 'package:ecommerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class CartScreenStates{}
 class CartScreenInitState extends CartScreenStates{}
 class GetCartScreenLoadingState extends CartScreenStates{}
 class GetCartScreenSuccessState extends CartScreenStates{
  GetCartResponseEntity responseEntity;
  GetCartScreenSuccessState({required this.responseEntity});

 }
 class GetCartScreenErrorState extends CartScreenStates{
  Failures failures;
  GetCartScreenErrorState({required this.failures});
}

class DeleteItemInCartScreenLoadingState extends CartScreenStates{}
class DeleteItemInCartScreenSuccessState extends CartScreenStates{
 GetCartResponseEntity responseEntity;
 DeleteItemInCartScreenSuccessState({required this.responseEntity});

}
class DeleteItemInCartScreenErrorState extends CartScreenStates{
 Failures failures;
 DeleteItemInCartScreenErrorState({required this.failures});
}

class UpdateCountInCartScreenLoadingState extends CartScreenStates{}
class UpdateCountInCartScreenSuccessState extends CartScreenStates{
 GetCartResponseEntity responseEntity;
 UpdateCountInCartScreenSuccessState({required this.responseEntity});

}
class UpdateCountInCartScreenErrorState extends CartScreenStates{
 Failures failures;
 UpdateCountInCartScreenErrorState({required this.failures});
}