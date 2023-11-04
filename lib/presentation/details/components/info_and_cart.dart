import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_ui_app/core/utils/constants.dart';
import 'package:plant_ui_app/core/utils/k_images.dart';
import 'package:plant_ui_app/data/model/plant_model.dart';

import '../../../core/utils/utils.dart';
import '../../../widgets/custom_text_view.dart';

class BottomDetails extends StatelessWidget {
  const BottomDetails({
    super.key,
    required this.plantModel,
    this.animation = const AlwaysStoppedAnimation<double>(1),
  });

  final PlantModel plantModel;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ValueListenableBuilder(
        valueListenable: animation,
        builder: (_, value, __) {
          return FadeTransition(
            opacity: Tween<double>(begin: 0, end: 1).animate(animation),
            child: AnimatedContainer(
              height: 260,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              transform: Matrix4.translationValues(0, value, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SlideTransition(
                      position:
                          Tween(begin: const Offset(0, 0.5), end: Offset.zero)
                              .animate(animation),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlantCondition(
                            title: "Height",
                            value: plantModel.height,
                            icon: KImages.heightIcon,
                          ),
                          Utils.horizontalSpace(10),
                          PlantCondition(
                            title: "Temperature",
                            value: plantModel.temperature,
                            icon: KImages.hotIcon,
                          ),
                          Utils.horizontalSpace(10),
                          PlantCondition(
                            title: "Pot",
                            value: plantModel.pot,
                            icon: KImages.potIcon,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SlideTransition(
                          position: Tween(
                                  begin: const Offset(-1, 0), end: Offset.zero)
                              .animate(animation),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomTextView(
                                text: "Total Price",
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              CustomTextView(
                                text: "\$${plantModel.price}",
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(value * 30),
                          width: value * size.width * 0.5,
                          // duration: Duration(milliseconds: 300),
                          // curve: Curves.fastOutSlowIn,
                          decoration: BoxDecoration(
                              color: kDefaultIconDarkColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(30)),
                          child: CustomTextView(
                            text: "Add to Cart",
                            color: Colors.white,
                            fontSize: value * 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          );
        });
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
          Image.asset(
            icon,
            height: 20.h,
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
