import 'package:bloc/bloc.dart';
import 'package:cubid_crud/data/service/item_repo.dart';
import 'package:meta/meta.dart';

import '../models/item_model.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  final ItemRepository _itemRepository;
  ItemCubit(this._itemRepository) : super(ItemInitial());

  Future<void> syncNotes() async {
    try {
      emit(ItemLoading());
      List<ItemModel> notesFromApi = await _itemRepository.fetchItems();
      await _itemRepository.syncToLocal(notesFromApi);
      final notesFromLocal = await _itemRepository.fetchItemsLocal();
      emit(ItemLoaded(notesFromLocal));
    } catch (e) {
      emit(ItemFailure(e.toString()));
    }
  }

  Future<void> getItemsLocal() async{
    try {
      emit(ItemLoading());
      final notesFromLocal = await _itemRepository.fetchItemsLocal();
      emit(ItemLoaded(notesFromLocal));
    } catch (e) {
      emit(ItemFailure(e.toString()));
    }
  }
}
