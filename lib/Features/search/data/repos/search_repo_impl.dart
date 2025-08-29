import 'package:sel3_app/Features/home/data/models/advertise_model.dart';
import 'package:sel3_app/Features/search/logic/repos/search_repo.dart';
import 'package:sel3_app/core/network/constants.dart';
import 'package:sel3_app/core/services/api_service.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;
  SearchRepoImpl({required this.apiService});
  @override
  Future<List<AdvertiseModel>> allSearchItems() async {
    final res = await apiService.getRequest(endpoint: allAdvertismentsTable);

    List<dynamic> jsonData = res.data;
    List<AdvertiseModel> allAdvertisements = jsonData
        .map((e) => AdvertiseModel.fromJson(e))
        .toList();
    return allAdvertisements;
  }

  @override
  Future<List<AdvertiseModel>> getSearchItems({required String query}) async {
    final res = await allSearchItems();

    List<AdvertiseModel> searchItems = [];

    for (var element in res) {
      if (element.title.toLowerCase().contains(query.toLowerCase())) {
        searchItems.add(element);
      } else {
        searchItems.remove(element);
      }
    }
    return searchItems;
  }
}
