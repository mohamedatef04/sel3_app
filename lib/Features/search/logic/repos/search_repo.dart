import 'package:sel3_app/Features/home/data/models/advertise_model.dart';

abstract class SearchRepo {
  Future<List<AdvertiseModel>> allSearchItems();
  Future<List<AdvertiseModel>> getSearchItems({
    required String query,
  });
}
