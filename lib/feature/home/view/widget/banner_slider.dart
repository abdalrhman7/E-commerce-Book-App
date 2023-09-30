import 'package:book_store/core/constants/text_style.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_color.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.24.sh,
      child: Swiper(
        autoplayDelay: 5000,
        itemCount: 3,
        itemBuilder: (ctx, index) {
          return const SaleWidget();
        },
        autoplay: true,
        pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            size: 6,
            color: Colors.white,
            activeColor: Colors.red,
          ),
        ),
        // control: const SwiperControl(),
      ),
    );
  }
}

class SaleWidget extends StatelessWidget {
  const SaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kMainColor,
            Color(0xFF82C3DF),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(14.r),
              child: Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Text(
                  "Get Programming Books",
                  style: Style.textStyle14.copyWith(
                      overflow: TextOverflow.visible, color: Colors.white),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(14.r),
              child: Image.network(
                width: double.infinity,
                // height: double.infinity,
                "https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/7931719/books-clipart-md.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
