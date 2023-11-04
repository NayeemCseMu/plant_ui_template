import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_ui_app/core/utils/constants.dart';
import 'package:plant_ui_app/data/model/plant_model.dart';
import 'package:plant_ui_app/widgets/custom_image_view.dart';
import 'package:plant_ui_app/widgets/price_favorite_btn.dart';

import '../../../core/utils/utils.dart';
import '../../../widgets/custom_text_view.dart';
import '../../../widgets/plant_title.dart';

class BodyDetails extends StatelessWidget {
  const BodyDetails({
    super.key,
    required this.plantModel,
    this.animation = const AlwaysStoppedAnimation<double>(1),
  });

  final PlantModel plantModel;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final outDx = 20 * animation.value;
    final outDy = 10 * animation.value;
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.start,

        // physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: size.height * 0.4,
            width: size.width,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              alignment: const Alignment(0, 0),
              children: [
                FadeTransition(
                  opacity: Tween<double>(begin: 1, end: 0).animate(animation),
                  child: Stack(
                    children: [
                      // Transform.translate(
                      //     offset: Offset(-outDx, 0),
                      //     child: PlantTitle(
                      //         title: "${plantModel.name}", fontS: 18)),
                      Transform.translate(
                          offset: Offset(-outDx, 0),
                          child: PlantPrice(price: "${plantModel.price}")),
                      Transform.translate(
                          offset: Offset(outDx, 0), child: const FavoriteBtn()),
                    ],
                  ),
                ),
                Hero(
                  tag: plantModel.image,
                  child: CustomImageView(
                    imagePath: plantModel.image,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 80,
                  child: Column(
                    children: [
                      ...List.generate(
                        3,
                        (index) => Container(
                          height: index == 0 ? 20.h : 8.h,
                          width: 8.w,
                          // duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                              color:
                                  index == 0 ? kPrimaryColor : kLightTextColor,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Utils.verticalSpace(16),
          Positioned(
            bottom: -50,
            left: 40,
            child: Hero(
              tag: plantModel.name,
              child: PlantTitle(
                title: plantModel.name,
                fontS: 24,
              ),
            ),
          ),
          Utils.verticalSpace(20),
          Positioned(
            bottom: -110,
            left: 40,
            right: 40,
            child: FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(animation),
              child: CustomTextView(
                text: plantModel.details,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
                color: kLightTextColor,
                maxLines: 2,
              ),
            ),
          ),
          Utils.verticalSpace(20),
        ],
      ),
    );
  }
}
