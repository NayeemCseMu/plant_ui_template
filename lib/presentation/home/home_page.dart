import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_ui_app/core/utils/constants.dart';
import 'package:plant_ui_app/core/utils/k_images.dart';
import 'package:plant_ui_app/core/utils/utils.dart';
import 'package:plant_ui_app/data/dummy_data.dart';
import 'package:plant_ui_app/data/model/plant_model.dart';
import 'package:plant_ui_app/presentation/details/plant_detials.dart';
import 'package:plant_ui_app/widgets/custom_image_view.dart';
import 'package:plant_ui_app/widgets/custom_text_view.dart';

import '../../widgets/plant_title.dart';
import '../../widgets/price_favorite_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  Animation<double> get interval1 => CurvedAnimation(
      parent: animation, curve: const Interval(0.4, 1, curve: Curves.easeIn));

  Animation<double> get interval2 => CurvedAnimation(
      parent: animation, curve: const Interval(0.6, 1, curve: Curves.easeIn));

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);

    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Products"),
        centerTitle: true,
        actions: [
          SlideTransition(
            position: Tween(begin: const Offset(1, 0), end: Offset.zero)
                .animate(animation),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(KImages.profile),
            ),
          ),
          Utils.horizontalSpace(10),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: FadeTransition(
              opacity: interval2,
              child: Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 52.h,
                    child: TextField(
                      decoration: inputDecoration,
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
                      children: [
                        if (i == 0) ...[
                          SlideTransition(
                            position: Tween<Offset>(
                                    begin: const Offset(-0.3, 0),
                                    end: Offset.zero)
                                .animate(interval2),
                            child: FadeTransition(
                              opacity: interval2,
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 4, right: 8, bottom: 8),
                                child: CustomTextView(
                                  text: "Found \n10 Results",
                                  fontSize: 28,
                                  textAlign: TextAlign.start,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                        SlideTransition(
                          position: Tween<Offset>(
                                  begin: const Offset(0, 0.3), end: Offset.zero)
                              .animate(interval1),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 600),
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 600),
                                  pageBuilder: (_, animation, __) =>
                                      FadeTransition(
                                    opacity: animation,
                                    child: PlantDetailsInfo(
                                      plantModel: KDummyData.plantsList[i],
                                      animation: animation,
                                    ),
                                  ),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return child;
                                  },
                                ),
                              );
                            },
                            child: PlantCard(
                              item: KDummyData.plantsList[i],
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

  final InputDecoration inputDecoration = InputDecoration(
    fillColor: kGray_100,
    filled: true,
    prefixIcon: Padding(
      padding: const EdgeInsets.all(12.0),
      child: SvgPicture.asset(
        KImages.searchIcon,
      ),
    ),
    hintText: "Search",
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white)),
  );
}

class PlantCard extends StatelessWidget {
  const PlantCard({
    super.key,
    required this.item,
  });

  final PlantModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
