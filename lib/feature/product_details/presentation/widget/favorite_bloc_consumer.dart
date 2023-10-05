import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/widgets/main_snack_bar.dart';
import '../../business_logic/favorite_cubit/favorite_cubit.dart';

class FavoriteButtonBlocConsumer extends StatelessWidget {
  const FavoriteButtonBlocConsumer({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<FavoriteCubit>(context);
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state is AddToFavoriteSuccess) {
          mainSnackBar(
            context: context,
            title: 'Item Added to Favorite',
            success: true,
          );
        }
        if (state is AddToFavoriteError) {
          mainSnackBar(
            context: context,
            title: 'Could\'t add to Favorite Try again later',
            success: false,
          );
        }
        if (state is RemoveFromFavoriteSuccess) {
          mainSnackBar(
            context: context,
            title: 'Item Removed From Favorite',
            success: true,
          );
        }
        if (state is RemoveFromFavoriteError) {
          mainSnackBar(
            context: context,
            title: 'Could\'t remove from Favorite Try again later',
            success: false,
          );
        }
      },
      builder: (context, state) => buildFavoriteButton(cubit),
    );
  }

  Widget buildFavoriteButton(FavoriteCubit cubit) {
    return InkWell(
      onTap: () {
        cubit.isFavorite
            ? cubit.removeFromFavorite(productId: productId)
            : cubit.addToFavorite(productId: productId);
      },
      borderRadius: BorderRadius.circular(50.w),
      child: Container(
        height: 45.h,
        width: 45.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white70,
          border: Border.all(color: Colors.black45),
        ),
        child: cubit.isFavorite
            ? const Icon(Icons.favorite, color: kMainColor)
            : const Icon(Icons.favorite_border),
      ),
    );
  }
}
