import 'package:equatable/equatable.dart';

class AdvertiseModel extends Equatable {
  final String id;
  final String userId;
  final String timeCreated;
  final String title;
  final String description;
  final String price;
  final String category;
  final String location;
  final String city;
  final String? image_1;
  final String? image_2;
  final String? image_3;
  final String? image_4;
  final String? image_5;
  final bool isSpecial;

  final List? favourites;

  AdvertiseModel({
    required this.id,
    required this.userId,
    required this.timeCreated,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.location,
    required this.city,
    required this.image_1,
    required this.image_2,
    required this.image_3,
    required this.image_4,
    required this.image_5,
    required this.isSpecial,
    this.favourites,
  });

  factory AdvertiseModel.fromJson(Map<String, dynamic> json) {
    return AdvertiseModel(
      id: json['id'],
      userId: json['user_id'],
      timeCreated: json['created_at'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      category: json['category'],
      location: json['location'],
      city: json['city'],
      image_1: json['pic_1'],
      image_2: json['pic_2'],
      image_3: json['pic_3'],
      image_4: json['pic_4'],
      image_5: json['pic_5'],
      isSpecial: json['is_special'],
      favourites: json['favourites'],
    );
  }

  factory AdvertiseModel.placeHolder() {
    return AdvertiseModel(
      id: '',
      userId: '',
      timeCreated: '',
      title: 'nike shoes',
      description: '',
      price: '',
      category: '',
      location: '',
      city: '',
      image_1:
          'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_640.png',
      image_2: '',
      image_3: '',
      image_4: '',
      image_5: '',
      isSpecial: false,
    );
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    timeCreated,
    title,
    description,
    price,
    category,
    location,
    city,
    image_1,
    image_2,
    image_3,
    image_4,
    image_5,
    isSpecial,
    favourites,
  ];
}
