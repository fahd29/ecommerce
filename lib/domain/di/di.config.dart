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
import '../../data/data_sources/remote_data_source/add_product_to_wish_list_ds.dart'
    as _i478;
import '../../data/data_sources/remote_data_source/add_product_to_wish_list_ds_impl.dart'
    as _i168;
import '../../data/data_sources/remote_data_source/add_to_cart_ds.dart'
    as _i999;
import '../../data/data_sources/remote_data_source/add_to_cart_ds_impl.dart'
    as _i467;
import '../../data/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i45;
import '../../data/data_sources/remote_data_source/auth_remote_data_source_impl.dart'
    as _i373;
import '../../data/data_sources/remote_data_source/cart_remote_ds.dart'
    as _i717;
import '../../data/data_sources/remote_data_source/cart_remote_ds_impl.dart'
    as _i181;
import '../../data/data_sources/remote_data_source/categoryOrBrand_ds.dart'
    as _i234;
import '../../data/data_sources/remote_data_source/categoryOrBrand_ds_impl.dart'
    as _i362;
import '../../data/data_sources/remote_data_source/get_logged_user_wash_list_ds.dart'
    as _i183;
import '../../data/data_sources/remote_data_source/get_logged_user_washlist_ds_impl.dart'
    as _i81;
import '../../data/data_sources/remote_data_source/product_remote_ds.dart'
    as _i447;
import '../../data/data_sources/remote_data_source/product_remote_ds_impl.dart'
    as _i43;
import '../../data/repository/add_product_to_wishlist_repo_impl.dart' as _i341;
import '../../data/repository/add_toCart_repo_impl.dart' as _i346;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../data/repository/cart_repository_impl.dart' as _i942;
import '../../data/repository/categoryOrBrand_repo_impl.dart' as _i319;
import '../../data/repository/get_logged_user_wash_list_repo_impl.dart'
    as _i1014;
import '../../data/repository/product_repo_impl.dart' as _i955;
import '../../features/auth/presentation/register/cubit/auth_view_model.dart'
    as _i406;
import '../../features/cart/cubit/cart_screen_view_model.dart' as _i1055;
import '../../features/main_layout/categories/presentation/cubit/product_view_model.dart'
    as _i650;
import '../../features/main_layout/cubit/home_view_model.dart' as _i562;
import '../../features/main_layout/favourite/presentation/cubit/favourite_view_model.dart'
    as _i410;
import '../../features/main_layout/mainlayout_viewModel.dart' as _i647;
import '../repository/add_product_towishlist_repo.dart' as _i947;
import '../repository/add_toCart_repo.dart' as _i74;
import '../repository/auth_repository.dart' as _i106;
import '../repository/cart_repository.dart' as _i900;
import '../repository/categoryOrBrand_repo.dart' as _i691;
import '../repository/get_logged_user_watch_list_repo.dart' as _i975;
import '../repository/product_repo.dart' as _i537;
import '../use_case/add_product_towishList_usecase.dart' as _i444;
import '../use_case/add_to_cart_usecase.dart' as _i957;
import '../use_case/brand_use_case.dart' as _i139;
import '../use_case/category_use_case.dart' as _i809;
import '../use_case/delete_item_in_cart_use_case.dart' as _i489;
import '../use_case/get_cart_use_case.dart' as _i829;
import '../use_case/get_user_wash_list_usecase.dart' as _i456;
import '../use_case/login_usecase.dart' as _i89;
import '../use_case/product_usecase.dart' as _i810;
import '../use_case/register_usecase.dart' as _i19;
import '../use_case/remove_product_fromwishList_usecase.dart' as _i391;
import '../use_case/update_count_in_cart_use_case.dart' as _i1007;

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
    gh.factory<_i717.CartRemoteDs>(
        () => _i181.CartRemoteDsImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i691.CategoryOrBrandRepo>(() => _i319.CategoryOrBrandRepoImpl(
        categoryOrBrandDs: gh<_i234.CategoryOrBrandDs>()));
    gh.factory<_i183.GetLoggedUserWishListDs>(
        () => _i81.GetLoggedWashListDsImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i447.ProductRemoteDs>(
        () => _i43.ProductRemoteDSImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i45.AuthRemoteDataSource>(() =>
        _i373.AuthRemoteDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i999.AddToCartDs>(
        () => _i467.AddToCartDsImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i478.AddProductToWishListDs>(() =>
        _i168.AddProductToWishListDsImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i537.ProductRepository>(() =>
        _i955.ProductRepoImpl(productRemoteDs: gh<_i447.ProductRemoteDs>()));
    gh.factory<_i139.BrandUseCase>(() => _i139.BrandUseCase(
        categoryOrBrandRepo: gh<_i691.CategoryOrBrandRepo>()));
    gh.factory<_i809.CategoryUseCase>(() => _i809.CategoryUseCase(
        categoryOrBrandRepo: gh<_i691.CategoryOrBrandRepo>()));
    gh.factory<_i900.CartRepository>(
        () => _i942.CartRepositoryImpl(cartRemoteDs: gh<_i717.CartRemoteDs>()));
    gh.factory<_i74.AddToCartRepo>(
        () => _i346.AddToCartRepoImpl(addToCartDs: gh<_i999.AddToCartDs>()));
    gh.factory<_i975.GetLoggedUserWashListRepo>(() =>
        _i1014.GetLoggedUserWashListRepoImpl(
            getLoggedUserWishListDs: gh<_i183.GetLoggedUserWishListDs>()));
    gh.factory<_i947.AddProductToWishListRepo>(() =>
        _i341.AddProductToWishListRepoImpl(
            addProductToWishListDs: gh<_i478.AddProductToWishListDs>()));
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
    gh.factory<_i444.AddProductToWishListUseCase>(() =>
        _i444.AddProductToWishListUseCase(
            addProductToWishListRepo: gh<_i947.AddProductToWishListRepo>()));
    gh.factory<_i391.RemoveProductFromWishListUseCase>(() =>
        _i391.RemoveProductFromWishListUseCase(
            addProductToWishListRepo: gh<_i947.AddProductToWishListRepo>()));
    gh.factory<_i829.GetCartUseCase>(
        () => _i829.GetCartUseCase(cartRepository: gh<_i900.CartRepository>()));
    gh.factory<_i489.DeleteItemInCartUseCase>(() =>
        _i489.DeleteItemInCartUseCase(
            cartRepository: gh<_i900.CartRepository>()));
    gh.factory<_i1007.UpdateCountInCartUseCase>(() =>
        _i1007.UpdateCountInCartUseCase(
            cartRepository: gh<_i900.CartRepository>()));
    gh.factory<_i456.GetLoggedUserWashListUseCase>(() =>
        _i456.GetLoggedUserWashListUseCase(
            getLoggedUserWashListRepo: gh<_i975.GetLoggedUserWashListRepo>()));
    gh.factory<_i1055.CartScreenViewModel>(() => _i1055.CartScreenViewModel(
          getCartUseCase: gh<_i829.GetCartUseCase>(),
          deleteItemInCartUseCase: gh<_i489.DeleteItemInCartUseCase>(),
          updateCountInCartUseCase: gh<_i1007.UpdateCountInCartUseCase>(),
        ));
    gh.factory<_i406.AuthViewModel>(() => _i406.AuthViewModel(
          registerUseCase: gh<_i19.RegisterUseCase>(),
          loginUseCase: gh<_i89.LoginUseCase>(),
        ));
    gh.factory<_i650.ProductViewModel>(() => _i650.ProductViewModel(
          productUseCase: gh<_i810.ProductUseCase>(),
          addToCartUseCase: gh<_i957.AddToCartUseCase>(),
          addProductToWishListUseCase: gh<_i444.AddProductToWishListUseCase>(),
        ));
    gh.factory<_i647.MainLayoutViewModel>(() => _i647.MainLayoutViewModel(
        countAboveUseCase: gh<_i957.AddToCartUseCase>()));
    gh.factory<_i410.FavouriteViewModel>(() => _i410.FavouriteViewModel(
          getLoggedUserWashListUseCase:
              gh<_i456.GetLoggedUserWashListUseCase>(),
          removeProductFromWishListUseCase:
              gh<_i391.RemoveProductFromWishListUseCase>(),
        ));
    return this;
  }
}
