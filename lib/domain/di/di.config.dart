// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_manager.dart' as _i236;
import '../../data/data_sources/remote_data_source/add_to_cart_ds.dart'
    as _i999;
import '../../data/data_sources/remote_data_source/add_to_cart_ds_impl.dart'
    as _i467;
import '../../data/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i45;
import '../../data/data_sources/remote_data_source/auth_remote_data_source_impl.dart'
    as _i373;
import '../../data/data_sources/remote_data_source/categoryOrBrand_ds.dart'
    as _i234;
import '../../data/data_sources/remote_data_source/categoryOrBrand_ds_impl.dart'
    as _i362;
import '../../data/data_sources/remote_data_source/product_remote_ds.dart'
    as _i447;
import '../../data/data_sources/remote_data_source/product_remote_ds_impl.dart'
    as _i43;
import '../../data/repository/add_toCart_repo_impl.dart' as _i346;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../data/repository/categoryOrBrand_repo_impl.dart' as _i319;
import '../../data/repository/product_repo_impl.dart' as _i955;
import '../../features/auth/presentation/register/cubit/auth_view_model.dart'
    as _i406;
import '../../features/main_layout/categories/presentation/cubit/product_view_model.dart'
    as _i650;
import '../../features/main_layout/cubit/home_view_model.dart' as _i562;
import '../repository/add_toCart_repo.dart' as _i74;
import '../repository/auth_repository.dart' as _i106;
import '../repository/categoryOrBrand_repo.dart' as _i691;
import '../repository/product_repo.dart' as _i537;
import '../use_case/add_to_cart_usecase.dart' as _i957;
import '../use_case/brand_use_case.dart' as _i139;
import '../use_case/category_use_case.dart' as _i809;
import '../use_case/login_usecase.dart' as _i89;
import '../use_case/product_usecase.dart' as _i810;
import '../use_case/register_usecase.dart' as _i19;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i236.ApiManager>(() => _i236.ApiManager());
    gh.factory<_i234.CategoryOrBrandDs>(
        () => _i362.CategoryOrBrandDsImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i691.CategoryOrBrandRepo>(() => _i319.CategoryOrBrandRepoImpl(
        categoryOrBrandDs: gh<_i234.CategoryOrBrandDs>()));
    gh.factory<_i447.ProductRemoteDs>(
        () => _i43.ProductRemoteDSImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i45.AuthRemoteDataSource>(() =>
        _i373.AuthRemoteDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i999.AddToCartDs>(
        () => _i467.AddToCartDsImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i537.ProductRepository>(() =>
        _i955.ProductRepoImpl(productRemoteDs: gh<_i447.ProductRemoteDs>()));
    gh.factory<_i139.BrandUseCase>(() => _i139.BrandUseCase(
        categoryOrBrandRepo: gh<_i691.CategoryOrBrandRepo>()));
    gh.factory<_i809.CategoryUseCase>(() => _i809.CategoryUseCase(
        categoryOrBrandRepo: gh<_i691.CategoryOrBrandRepo>()));
    gh.factory<_i74.AddToCartRepo>(
        () => _i346.AddToCartRepoImpl(addToCartDs: gh<_i999.AddToCartDs>()));
    gh.factory<_i562.HomeViewModel>(() => _i562.HomeViewModel(
          categoryUseCase: gh<_i809.CategoryUseCase>(),
          brandUseCase: gh<_i139.BrandUseCase>(),
          adsImages: gh<List<String>>(),
        ));
    gh.factory<_i106.AuthRepository>(() => _i581.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i45.AuthRemoteDataSource>()));
    gh.factory<_i957.AddToCartUseCase>(
        () => _i957.AddToCartUseCase(addToCartRepo: gh<_i74.AddToCartRepo>()));
    gh.factory<_i89.LoginUseCase>(
        () => _i89.LoginUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i19.RegisterUseCase>(
        () => _i19.RegisterUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i810.ProductUseCase>(() =>
        _i810.ProductUseCase(productRepository: gh<_i537.ProductRepository>()));
    gh.factory<_i406.AuthViewModel>(() => _i406.AuthViewModel(
          registerUseCase: gh<_i19.RegisterUseCase>(),
          loginUseCase: gh<_i89.LoginUseCase>(),
        ));
    gh.factory<_i650.ProductViewModel>(() => _i650.ProductViewModel(
          productUseCase: gh<_i810.ProductUseCase>(),
          addToCartUseCase: gh<_i957.AddToCartUseCase>(),
        ));
    return this;
  }
}
