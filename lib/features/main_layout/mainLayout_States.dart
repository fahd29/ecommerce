import 'package:ecommerce_app/domain/entity/AddToCartEntity.dart';

abstract class MainLayoutStates{}
class MainLayoutInit extends MainLayoutStates{}
class ChangeSelectedIndex extends MainLayoutStates{}
class ChangeCount extends MainLayoutStates{
  AddToCartEntity addToCartEntity;
  ChangeCount({required this.addToCartEntity});

}