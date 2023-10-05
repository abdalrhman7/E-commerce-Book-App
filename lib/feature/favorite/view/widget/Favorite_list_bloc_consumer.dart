import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/CustomCircularProgressIndicator.dart';
import '../../../../core/widgets/main_snack_bar.dart';
import '../../business_logic/get_favorite_cubit/get_favorite_cubit.dart';
import 'favorite_list_item.dart';

class FavoriteListBlocConsumer extends StatelessWidget {
  const FavoriteListBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetFavoriteCubit, GetFavoriteState>(
      listener: (context, state) {
        if (state is GetFavoriteError) {
          mainSnackBar(
            context: context,
            title: state.errorMessage,
            success: false,
          );
        }
      },
      builder: (context, state) {
        if(state is GetFavoriteSuccess) {
          return Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.favorites.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return  FavoriteListItem(favoriteBook: state.favorites[index],);
              },
            ),
          );
        }
        return const CustomCircularProgressIndicator();
      },
    );
  }
}