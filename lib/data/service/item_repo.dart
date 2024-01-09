import 'package:cubid_crud/data/models/item_detail_model.dart';
import 'package:cubid_crud/data/models/item_model.dart';
import 'package:cubid_crud/data/service/service.dart';

import '../db/db_helper.dart';

class ItemRepository {
  final ApiService _apiService =
      ApiService('https://demon-slayer-api.onrender.com');
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;

  Future<List<ItemModel>> fetchItems() async {
    final data = await _apiService.get('/v1');

    return List<ItemModel>.from(data.map((item) => ItemModel.fromJson(item)));
  }

  Future<List<ItemDetailModel>> fetchItemDetails(String url) async {
    final data = await _apiService.get('/v1/$url');

    return List<ItemDetailModel>.from(
        data.map((item) => ItemDetailModel.fromJson(item)));
  }

  // Local Data

  Future<int> syncToLocal(String table, var items) async {
    return await databaseHelper.insert(table, items);
  }

  Future<int> syncImages(String table, ImagesModel imagesModel) async {
    int recordsSynced = 0;
    for (var item in imagesModel.imageUrl) {
      SingleImagesModel model =
          SingleImagesModel(itemId: imagesModel.itemId, imageUrl: item);
      int id = await databaseHelper.insert(table, model);
      if (id != 0) recordsSynced++;
    }

    return recordsSynced;
  }

  Future<List<ItemDetailLocalModel>> fetchItemsLocal() async {
    final data = await databaseHelper.readAll('item_detail');
    return List<ItemDetailLocalModel>.from(data.map((item) => ItemDetailLocalModel.fromJson(item)));
  }

  String trimUrl(String url) {
    Uri uri = Uri.parse(url);
    String lastSegment = uri.pathSegments.last;

    return lastSegment;
  }
}
