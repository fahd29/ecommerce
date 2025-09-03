import 'dart:async';
import 'package:ecommerce_app/domain/use_case/brand_use_case.dart';
import 'package:ecommerce_app/domain/use_case/category_use_case.dart';
import 'package:ecommerce_app/features/main_layout/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeViewModel extends Cubit<HomeStates> {
  final CategoryUseCase categoryUseCase;
  final BrandUseCase brandUseCase;

  Timer? _adsTimer;
  final List<String> adsImages;

  HomeViewModel({
    required this.categoryUseCase,
    required this.brandUseCase,
    required this.adsImages,
  }) : super(HomeStates.initial()) {
    _startAdsTimer();
  }

  void getCategories() async {
    emit(state.copyWith(status: HomeStatus.loadingCategories));
    var either = await categoryUseCase.invoke();
    either.fold((error) {
      emit(state.copyWith(status: HomeStatus.errorCategories, failures: error));
    }, (response) {
      emit(state.copyWith(
        status: HomeStatus.successCategories,
        categoriesOrBrandResponseEntity: response,
        categoryList: response.data,
      ));
    });
  }

  void getBrands() async {
    emit(state.copyWith(status: HomeStatus.loadingBrands));
    var either = await brandUseCase.invoke();
    either.fold((error) {
      emit(state.copyWith(status: HomeStatus.errorBrands, failures: error));
    }, (response) {
      emit(state.copyWith(
        status: HomeStatus.successBrands,
        categoriesOrBrandResponseEntity: response,
        brandList: response.data,
      ));
    });
  }

  void _startAdsTimer() {
    _adsTimer = Timer.periodic(const Duration(milliseconds: 2500), (timer) {
      final newIndex = ((state.currentAdIndex ?? 0) + 1) % adsImages.length;
      emit(state.copyWith(status: HomeStatus.adsChanged, currentAdIndex: newIndex));
    });
  }

  @override
  Future<void> close() {
    _adsTimer?.cancel();
    return super.close();
  }
}
