import 'package:plant_ui_app/core/utils/k_images.dart';

import 'model/plant_model.dart';

class KDummyData {
  static List<String> onboardingImages = [
    KImages.plantImgFour,
    KImages.plantImgTwo,
    KImages.plantImgThree,
  ];

  static List<PlantModel> plantsList = [
    PlantModel(
      id: 1,
      slug: "lucky-jade-plant",
      name: "Lucky Jade Plant",
      image: KImages.plantImgOne,
      price: 12.99,
      height: "30cm - 40cm",
      temperature: "24c",
      pot: "Ciramic Pot",
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mi in nulla posuere sollicitudin aliquam ultrices sagittis",
    ),
    PlantModel(
      id: 2,
      slug: "snake-plant",
      name: "Snake Plant",
      image: KImages.plantImgTwo,
      price: 15.99,
      height: "18cm - 40cm",
      temperature: "24c",
      pot: "Ciramic Pot",
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mi in nulla posuere sollicitudin aliquam ultrices sagittis",
    ),
    PlantModel(
      id: 2,
      slug: "peporomia-plant",
      name: "Peporomia Plant",
      image: KImages.plantImgThree,
      height: "15cm - 35cm",
      temperature: "30c",
      pot: "Ciramic Pot",
      price: 8.99,
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mi in nulla posuere sollicitudin aliquam ultrices sagittis",
    ),
    PlantModel(
      id: 2,
      slug: "clematis-plant",
      name: "Clematis Plant",
      image: KImages.plantImgFour,
      height: "20cm - 20cm",
      temperature: "28c",
      pot: "Ciramic Pot",
      price: 5.99,
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mi in nulla posuere sollicitudin aliquam ultrices sagittis",
    ),
    PlantModel(
      id: 2,
      slug: "small-plant",
      name: "Small Plant",
      image: KImages.plantImgFive,
      height: "20cm - 20cm",
      temperature: "28c",
      pot: "Ciramic Pot",
      price: 5.99,
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mi in nulla posuere sollicitudin aliquam ultrices sagittis",
    ),
    PlantModel(
      id: 2,
      slug: "levendar-plant",
      name: "Levendar Plant",
      image: KImages.plantImgSix,
      height: "20cm - 20cm",
      temperature: "28c",
      pot: "Ciramic Pot",
      price: 5.99,
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mi in nulla posuere sollicitudin aliquam ultrices sagittis",
    ),
    PlantModel(
      id: 2,
      slug: "Tunais-plant",
      name: "tunais Plant",
      image: KImages.plantImgOne,
      height: "20cm - 20cm",
      temperature: "28c",
      pot: "Ciramic Pot",
      price: 5.99,
      details:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mi in nulla posuere sollicitudin aliquam ultrices sagittis",
    ),
  ];
}
