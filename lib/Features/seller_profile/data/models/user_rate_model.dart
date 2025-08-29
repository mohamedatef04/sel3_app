class UserRateModel {
  final String comment;
  final String rate;
  final String from;
  final String to;

  UserRateModel({
    required this.comment,
    required this.rate,
    required this.from,
    required this.to,
  });

  factory UserRateModel.fromJson(Map<String, dynamic> json) {
    return UserRateModel(
      comment: json['comment'],
      rate: json['rate_value'],
      from: json['from'],
      to: json['to'],
    );
  }
}
