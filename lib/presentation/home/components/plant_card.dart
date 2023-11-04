import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../data/model/plant_model.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/plant_title.dart';
import '../../../widgets/price_favorite_btn.dart';

class PlantCard extends StatelessWidget {
  const PlantCard({
    super.key,
    required this.item,
    required this.press,
  });

  final PlantModel item;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        decoration: BoxDecoration(
            color: kGray_100, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Hero(
              tag: item.image,
              flightShuttleBuilder: (flightContext, animation, flightDirection,
                  fromHeroContext, toHeroContext) {
                switch (flightDirection) {
                  case HeroFlightDirection.push:
                    return Material(
                        type: MaterialType.transparency,
                        child: SlideTransition(
                            position: animation.drive(Tween(
                                    begin: const Offset(0, 0.5),
                                    end: const Offset(0, 0))
                                .chain(CurveTween(curve: Curves.ease))),
                            child: toHeroContext.widget));

                  case HeroFlightDirection.pop:
                    return Material(
                        type: MaterialType.transparency,
                        child: SlideTransition(
                            position: animation.drive(Tween(
                                    begin: const Offset(0, -0.5),
                                    end: const Offset(0, 0))
                                .chain(CurveTween(curve: Curves.ease))),
                            child: fromHeroContext.widget));
                }
              },
              child: CustomImageView(
                imagePath: item.image,
                height: 140.h,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                onTap: null,
              ),
            ),
            Utils.verticalSpace(16),
            Hero(
              tag: item.name,
              flightShuttleBuilder: (flightContext, animation, flightDirection,
                  fromHeroContext, toHeroContext) {
                switch (flightDirection) {
                  case HeroFlightDirection.push:
                    return Material(
                        type: MaterialType.transparency,
                        child: toHeroContext.widget);

                  case HeroFlightDirection.pop:
                    return Material(
                        type: MaterialType.transparency,
                        child: fromHeroContext.widget);
                }
              },
              child: PlantTitle(
                title: item.name,
                fontS: 18,
              ),
            ),
            Utils.verticalSpace(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlantPrice(
                  price: "${item.price}",
                ),
                const FavoriteBtn(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
