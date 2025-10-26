class UserModel {
  final String id;
  final String timeCreated;
  final String name;
  final String email;
  final String phone;
  String? image;
  List? rates;

  UserModel({
    required this.id,
    required this.timeCreated,
    required this.name,
    required this.email,
    required this.phone,
    this.image,
    this.rates,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user_id'],
      timeCreated: json['created_at'],
      name: json['user_name'],
      email: json['user_email'],
      phone: json['user_phone'],
      image: json['user_pic'],
      rates: json['rates'],
    );
  }
}
