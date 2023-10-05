import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/text_style.dart';
import '../../../home/date/model/products.dart';
import '../../business_logic/get_favorite_cubit/get_favorite_cubit.dart';

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({super.key, required this.favoriteBook});

  final Books favoriteBook;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.h,
      child: Card(
        elevation: 0.8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.w),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.w),
                bottomLeft: Radius.circular(18.w),
              ),
              child: SizedBox(
                height: double.infinity,
                width: .16.sh,
                child: FancyShimmerImage(
                  width: double.infinity,
                  errorWidget: const Icon(Icons.error),
                  imageUrl: favoriteBook.image!,
                  boxFit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Container(
              constraints: BoxConstraints(maxWidth: 0.16.sh),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    favoriteBook.name!,
                    maxLines: 2,
                    style:
                        Style.textStyle16.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Text(
                    '${favoriteBook.price} L.E',
                    style:
                        Style.textStyle14.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.r),
              child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                     BlocProvider.of<GetFavoriteCubit>(context).removeFromFavorite(productId: favoriteBook.id!);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
