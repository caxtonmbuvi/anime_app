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

  Future<List<ItemModel>> fetchItemDetails(String url) async {
    final data = await _apiService.get('v1/$url');

    return List<ItemModel>.from(data.map((item) => ItemModel.fromJson(item)));
  }

  // Local Data

  Future<int> syncToLocal(List<ItemModel> items) async {
    int recordsSynced = 0;
    for (var item in items) {
      int id = await databaseHelper.insert('items', item);
      if (id != 0) recordsSynced++;
    }

    return recordsSynced;
  }

  Future<List<ItemModel>> fetchItemsLocal() async {
    final data = await databaseHelper.readAll('items');
    return List<ItemModel>.from(data.map((item) => ItemModel.fromJson(item)));
  }
}
