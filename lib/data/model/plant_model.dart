// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PlantModel extends Equatable {
  final int id;
  final String slug;
  final String name;
  final String image;
  final double price;
  final String details;
  const PlantModel({
    required this.id,
    required this.slug,
    required this.name,
    required this.image,
    required this.price,
    required this.details,
  });

  PlantModel copyWith({
    int? id,
    String? slug,
    String? name,
    String? image,
    double? price,
    String? details,
  }) {
    return PlantModel(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'slug': slug,
      'name': name,
      'image': image,
      'price': price,
      'details': details,
    };
  }

  factory PlantModel.fromMap(Map<String, dynamic> map) {
    return PlantModel(
      id: map['id'] as int,
      slug: map['slug'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      details: map['details'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlantModel.fromJson(String source) =>
      PlantModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      slug,
      name,
      image,
      price,
      details,
    ];
  }
}
