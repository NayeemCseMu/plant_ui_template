import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_ui_app/core/app_routes.dart';
import 'package:plant_ui_app/core/utils/constants.dart';
import 'package:plant_ui_app/core/utils/k_images.dart';
import 'package:plant_ui_app/core/utils/utils.dart';
import 'package:plant_ui_app/data/dummy_data.dart';
import 'package:plant_ui_app/widgets/custom_image_view.dart';
import 'package:plant_ui_app/widgets/custom_text_view.dart';
import 'package:plant_ui_app/widgets/slider_onboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Products"),
        centerTitle: true,
        actions: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(KImages.profile),
          ),
          Utils.horizontalSpace(10),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: kGray_100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white)),
                  child: Row(
                    children: [
                      SvgPicture.asset(KImages.searchIcon),
                      Utils.horizontalSpace(10),
                      const Text("Search")
                    ],
                  ),
                )),
                Utils.horizontalSpace(10),
                Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                      color: kGray_100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(KImages.filterIcon),
                  ),
                ),
              ],
            ),
          ),
          Utils.verticalSpace(0),
          Expanded(
              child: MasonryGridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  itemCount: KDummyData.plantsList.length,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (c, i) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (i == 0) ...[
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 4, right: 8, bottom: 8),
                            child: CustomTextView(
                              text: "Found \n10 Results",
                              fontSize: 28,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.details,
                                arguments: i);
                          },
                          child: Container(
                            // height: 300.h,

                            decoration: BoxDecoration(
                                color: kGray_100,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 30),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag: i,
                                    child: CustomImageView(
                                      imagePath: KDummyData.plantsList[i].image,
                                      height: 140.h,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                      onTap: null,
                                    ),
                                  ),
                                  Utils.verticalSpace(16),
                                   CustomTextView(
                                    text: KDummyData.plantsList[i].name,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                  ),
                                  Utils.verticalSpace(30),
                                   Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextView(
                                        text: "\$${KDummyData.plantsList[i].price}",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const CircleAvatar(
                                        radius: 16,
                                        backgroundColor: Colors.black,
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  })),
        ],
      ),
    );
  }
}
