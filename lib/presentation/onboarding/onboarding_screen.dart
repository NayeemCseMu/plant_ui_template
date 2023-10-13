import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant_ui_app/core/app_routes.dart';
import 'package:plant_ui_app/core/utils/utils.dart';
import 'package:plant_ui_app/data/dummy_data.dart';
import 'package:plant_ui_app/widgets/slider_onboard.dart';

import '../../core/utils/constants.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_view.dart';

class OnbardingScreen extends StatefulWidget {
  const OnbardingScreen({super.key});

  @override
  State<OnbardingScreen> createState() => _OnbardingScreenState();
}

class _OnbardingScreenState extends State<OnbardingScreen> {
  late PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    controller =
        PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: CustomTextView(
                  text: "Skip",
                  fontWeight: FontWeight.w500,
                  color: kParagraphText,
                  fontSize: 16,
                ),
              ),
              Utils.verticalSpace(10),
              Expanded(
                child: PageView.builder(
                    controller: controller,
                    itemCount: KDummyData.onboardingImages.length,
                    onPageChanged: (v) {
                      setState(() {
                        currentPage = v;
                      });
                    },
                    itemBuilder: (c, i) {
                      return CustomImageView(
                        imagePath: KDummyData.onboardingImages[i],
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      );
                    }),
              ),
              Utils.verticalSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      KDummyData.onboardingImages.length,
                      (index) => AnimatedContainer(
                            height: 8.h,
                            width: currentPage == index ? 24.w : 8.w,
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                color: currentPage == index
                                    ? kPrimaryColor
                                    : kLightTextColor,
                                borderRadius: BorderRadius.circular(8)),
                          ))
                ],
              ),
              Utils.verticalSpace(20),
              const CustomTextView(
                text: "Enjoy your \nLife with Plants",
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.left,
                color: kTextColor,
                fontSize: 36,
              ),
              Utils.verticalSpace(30),
              GestureDetector(
                onTap: () {
                  if (currentPage < KDummyData.onboardingImages.length - 1) {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  } else {
                    Navigator.pushNamed(context, AppRoutes.home);
                  }
                },
                child: CircleAvatar(
                  radius: 40.r,
                  backgroundColor: kPrimaryColor,
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
              Utils.verticalSpace(16),
            ],
          ),
        ),
      )),
    );
  }
}
