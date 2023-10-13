import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_ui_app/core/utils/constants.dart';
import 'package:plant_ui_app/core/utils/k_images.dart';
import 'package:plant_ui_app/data/model/plant_model.dart';
import 'package:plant_ui_app/widgets/custom_image_view.dart';

import '../../core/utils/utils.dart';
import '../../widgets/custom_text_view.dart';

class PlantDetailsInfo extends StatelessWidget {
  const PlantDetailsInfo({super.key, required this.plantModel});
  final PlantModel plantModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(Icons.shopping_cart_outlined),
          Utils.horizontalSpace(16)
        ],
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: size.height * 0.4,
            child: Hero(
              tag: plantModel.slug,
              child: CustomImageView(
                imagePath: plantModel.image,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Utils.verticalSpace(16),
                CustomTextView(
                  text: plantModel.name,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
                Utils.verticalSpace(20),
                CustomTextView(
                  text: plantModel.details,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  color: kLightTextColor,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomSheet: Container(
        height: 260,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PlantCondition(
                    title: "Height",
                    value: plantModel.height,
                    icon: KImages.filterIcon,
                  ),
                  Utils.horizontalSpace(10),
                  PlantCondition(
                    title: "Temperature",
                    value: plantModel.temperature,
                    icon: KImages.filterIcon,
                  ),
                  Utils.horizontalSpace(10),
                  PlantCondition(
                    title: "Pot",
                    value: plantModel.pot,
                    icon: KImages.filterIcon,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextView(
                        text: "Total Price",
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomTextView(
                        text: "\$12.99",
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(30),
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                        color: kDefaultIconDarkColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30)),
                    child: const CustomTextView(
                      text: "Add to Cart",
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}

class PlantCondition extends StatelessWidget {
  const PlantCondition({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });
  final String title;
  final String value;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            color: Colors.white,
          ),
          Utils.verticalSpace(10),
          CustomTextView(
            text: title,
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          CustomTextView(
            text: value,
            color: Colors.white,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
