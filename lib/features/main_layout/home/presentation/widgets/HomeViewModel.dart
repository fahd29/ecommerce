import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeState>{
  HomeViewModel():super(LoadingState());
  void loadHomeScreen(){
    //show loading
    //call api
    //send data to view
    emit(LoadingState());
    emit(SuccessState());
  }
}
sealed class HomeState{}
class LoadingState extends HomeState{}
class SuccessState extends HomeState{}
class ErrorState extends HomeState{}