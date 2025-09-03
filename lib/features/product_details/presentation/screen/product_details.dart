// import 'package:ecommerce_app/core/resources/assets_manager.dart';
// import 'package:ecommerce_app/core/resources/color_manager.dart';
// import 'package:ecommerce_app/core/resources/styles_manager.dart';
// import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
// import 'package:ecommerce_app/domain/entity/ProductResponseEntity.dart';
// import 'package:ecommerce_app/features/product_details/presentation/widgets/product_color.dart';
// import 'package:ecommerce_app/features/product_details/presentation/widgets/product_description.dart';
// import 'package:ecommerce_app/features/product_details/presentation/widgets/product_item.dart';
// import 'package:ecommerce_app/features/product_details/presentation/widgets/product_label.dart';
// import 'package:ecommerce_app/features/product_details/presentation/widgets/product_rating.dart';
// import 'package:ecommerce_app/features/product_details/presentation/widgets/product_size.dart';
// import 'package:ecommerce_app/features/product_details/presentation/widgets/product_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class ProductDetails extends StatelessWidget {
//   ProductEntity product;
//    ProductDetails({required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Product Details',
//           style: getMediumStyle(color: ColorManager.appBarTitleColor)
//               .copyWith(fontSize: 20.sp),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: ImageIcon(
//                 AssetImage(IconsAssets.icSearch),
//                 color: ColorManager.primary,
//               )),
//           IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.shopping_cart_outlined,
//                 color: ColorManager.primary,
//               )),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             const ProductSlider(items: [
//               ProductItem(
//                 imageUrl:
//                     'https://assets.adidas.com/images/w_1880,f_auto,q_auto/6776024790f445b0873ee66fdcde54a1_9366/GX6544_HM3_hover.jpg',
//               ),
//               ProductItem(
//                 imageUrl:
//                     'https://assets.adidas.com/images/w_1880,f_auto,q_auto/6776024790f445b0873ee66fdcde54a1_9366/GX6544_HM3_hover.jpg',
//               ),
//               ProductItem(
//                 imageUrl:
//                     "https://assets.adidas.com/images/w_1880,f_auto,q_auto/6776024790f445b0873ee66fdcde54a1_9366/GX6544_HM3_hover.jpg",
//               )
//             ], initialIndex: 0),
//             SizedBox(
//               height: 24.h,
//             ),
//             const ProductLabel(
//                 productName: 'Nike Air Jordon', productPrice: 'EGP 3,500'),
//             SizedBox(
//               height: 16.h,
//             ),
//             const ProductRating(
//                 productBuyers: '3,230', productRating: '4.8 (7,500)'),
//             SizedBox(
//               height: 16.h,
//             ),
//             const ProductDescription(
//                 productDescription:
//                     'Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories'),
//             ProductSize(
//               size: const [35, 38, 39, 40],
//               onSelected: () {},
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Text('Color',
//                 style: getMediumStyle(color: ColorManager.appBarTitleColor)
//                     .copyWith(fontSize: 18.sp)),
//             ProductColor(color: const [
//               Colors.red,
//               Colors.blueAccent,
//               Colors.green,
//               Colors.yellow,
//             ], onSelected: () {}),
//             SizedBox(
//               height: 48.h,
//             ),
//             Row(
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       'Total price',
//                       style: getMediumStyle(
//                               color: ColorManager.primary.withOpacity(.6))
//                           .copyWith(fontSize: 18.sp),
//                     ),
//                     SizedBox(
//                       height: 12.h,
//                     ),
//                     Text('EGP 3,500',
//                         style:
//                             getMediumStyle(color: ColorManager.appBarTitleColor)
//                                 .copyWith(fontSize: 18.sp))
//                   ],
//                 ),
//                 SizedBox(
//                   width: 33.w,
//                 ),
//                 Expanded(
//                   child: CustomElevatedButton(
//                     label: 'Add to cart',
//                     onTap: () {},
//                     prefixIcon: Icon(
//                       Icons.add_shopping_cart_outlined,
//                       color: ColorManager.white,
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_item.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_label.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../domain/entity/ProductResponseEntity.dart';
class ProductDetails extends StatelessWidget {
  final ProductEntity product;
  const ProductDetails({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ هنا بنتأكد إن الصور List سواء كانت أصلاً List<String> أو مجرد String واحدة
    List<String> images;
    if (product.images != null && product.images!.isNotEmpty) {
      images = product.images!; // لو عندك في الـ entity images: List<String>
    } else if (product.imageCover != null) {
      images = [product.imageCover!]; // صورة واحدة فقط
    } else {
      images = [
        "https://via.placeholder.com/300" // fallback صورة افتراضية
      ];
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(IconsAssets.icSearch),
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ slider بياخد list من الصور
              ProductSlider(
                items: images
                    .map((url) => ProductItem(imageUrl: url))
                    .toList(),
                initialIndex: 0,
              ),
              SizedBox(height: 24.h),
              ProductLabel(
                productName: product.title ?? "Unknown product",
                productPrice: 'EGP ${product.price ?? 0}',
              ),
              SizedBox(height: 16.h),
              ProductRating(
                productBuyers: '${product.sold ?? 0}',
                productRating:
                '${product.ratingsAverage ?? 0} (${product.ratingsQuantity ?? 0})',
              ),
              SizedBox(height: 16.h),
              ProductDescription(
                productDescription: product.description ?? "No description",
              ),
              SizedBox(height: 20.h),
              Text(
                'Color',
                style: getMediumStyle(color: ColorManager.appBarTitleColor)
                    .copyWith(fontSize: 18.sp),
              ),
              // ✅ لو عندك ألوان، لو مش موجودة نسيبها فاضية

              SizedBox(height: 48.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total price',
                        style: getMediumStyle(
                            color: ColorManager.primary.withOpacity(.6))
                            .copyWith(fontSize: 18.sp),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'EGP ${product.price ?? 0}',
                        style: getMediumStyle(color: ColorManager.appBarTitleColor)
                            .copyWith(fontSize: 18.sp),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: CustomElevatedButton(
                      label: 'Add to cart',
                      onTap: () {},
                      prefixIcon: Icon(
                        Icons.add_shopping_cart_outlined,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

