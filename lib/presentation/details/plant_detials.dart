import 'package:flutter/material.dart';
import '../../data/model/plant_model.dart';

import '../../core/utils/utils.dart';
import 'components/body_info.dart';
import 'components/info_and_cart.dart';

class PlantDetailsInfo extends StatelessWidget {
  const PlantDetailsInfo({
    super.key,
    required this.plantModel,
    required this.animation,
  });
  final PlantModel plantModel;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(Icons.shopping_cart_outlined),
          Utils.horizontalSpace(16)
        ],
      ),
      body: SafeArea(
        child: BodyDetails(
          plantModel: plantModel,
        ),
      ),
      bottomSheet: BottomDetails(
        plantModel: plantModel,
        animation: animation,
      ),
    );
  }
}
