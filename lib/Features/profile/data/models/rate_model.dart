class RateModel {
  final String? image;
  final String name;
  final List<SingleRate> rates;

  RateModel({
    this.image,
    required this.name,
    required this.rates,
  });

  factory RateModel.fromJson(Map<String, dynamic> json) {
    return RateModel(
      image: json['user_pic'],
      name: json['user_name'],
      rates: (json['rates'] as List<dynamic>)
          .map((e) => SingleRate.fromJson(e))
          .toList(),
    );
  }

  factory RateModel.fromPlaceholder() {
    return RateModel(
      image: '',
      name: '',
      rates: [],
    );
  }
}

class SingleRate {
  final String to;
  final String from;
  final String comment;
  final String? date;
  final String rateValue;

  SingleRate({
    required this.to,
    required this.from,
    required this.comment,
    this.date,
    required this.rateValue,
  });

  factory SingleRate.fromJson(Map<String, dynamic> json) {
    return SingleRate(
      to: json['to'],
      from: json['from'],
      comment: json['comment'],
      date: json['created_at'],
      rateValue: json['rate_value'],
    );
  }
  factory SingleRate.fromPlaceholder() {
    return SingleRate(
      to: '',
      from: '',
      comment: '',
      date: '',
      rateValue: '',
    );
  }
}
