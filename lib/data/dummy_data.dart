import 'package:plant_ui_app/core/utils/k_images.dart';

import 'model/plant_model.dart';

class KDummyData {
  static List<String> onboardingImages = [
    KImages.plantImgOne,
    KImages.plantImgTwo,
    KImages.plantImgOne,
  ];

  static List<PlantModel> plantsList = [
    PlantModel(
      id: 1,
      slug: "lucky-jade-plant",
      name: "Lucky Jade Plant",
      image: KImages.plantImgOne,
      price: 12.99,
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mi in nulla posuere sollicitudin aliquam ultrices sagittis",
    ),
    PlantModel(
      id: 2,
      slug: "snake-plant",
      name: "Snake Plant",
      image: KImages.plantImgTwo,
      price: 15.99,
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mi in nulla posuere sollicitudin aliquam ultrices sagittis",
    ),
    PlantModel(
      id: 2,
      slug: "peporomia-plant",
      name: "Peporomia Plant",
      image: KImages.plantImgOne,
      price: 8.99,
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mi in nulla posuere sollicitudin aliquam ultrices sagittis",
    ),
    PlantModel(
      id: 2,
      slug: "small-plant",
      name: "Small Plant",
      image: KImages.plantImgTwo,
      price: 5.99,
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mi in nulla posuere sollicitudin aliquam ultrices sagittis",
    ),
  ];
}
