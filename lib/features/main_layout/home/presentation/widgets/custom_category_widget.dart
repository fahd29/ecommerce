import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/domain/entity/CategoryOrBrandEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryWidget extends StatelessWidget {
  final CategoryOrBrandEntity category;

  const CustomCategoryWidget({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: CachedNetworkImage(
            height: 100.h,
            width: 100.w,
            fit: BoxFit.cover,
            imageUrl: category.image ?? "",
            placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          category.name ?? "",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
