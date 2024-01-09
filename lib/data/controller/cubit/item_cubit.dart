import '../../../exports.dart';
import '../../models/item_detail_model.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  final ItemRepository _itemRepository;
  ItemCubit(this._itemRepository) : super(ItemInitial());

  Future<void> syncNotes() async {
    try {
      emit(ItemLoading());
      List<ItemModel> notesFromApi = await _itemRepository.fetchItems();
      for (var element in notesFromApi) {
        int itemId = await _itemRepository.syncToLocal('items', element);
        final url = _itemRepository.trimUrl(element.url);
        List<ItemDetailModel> notesDetailsFromApi =
            await _itemRepository.fetchItemDetails(url);

        ItemDetailLocalModel model =
          ItemDetailLocalModel(
            itemId: itemId.toString(),
            name: notesDetailsFromApi.first.name,
            gallery: "Gallery",
            image: notesDetailsFromApi.first.image,
            race: notesDetailsFromApi.first.race,
            gender: notesDetailsFromApi.first.gender,
            age: notesDetailsFromApi.first.age,
            height: notesDetailsFromApi.first.height,
            weight: notesDetailsFromApi.first.weight,
            birthday: notesDetailsFromApi.first.birthday,
            hairColor: notesDetailsFromApi.first.hairColor,
            eyeColor: notesDetailsFromApi.first.eyeColor,
            affiliation: notesDetailsFromApi.first.affiliation,
            occupation: notesDetailsFromApi.first.occupation,
            combatStyle: notesDetailsFromApi.first.combatStyle,
            partnerS: notesDetailsFromApi.first.partnerS,
            status: notesDetailsFromApi.first.status,
            relativeS: notesDetailsFromApi.first.relativeS,
            mangaDebut: notesDetailsFromApi.first.mangaDebut,
            animeDebut: notesDetailsFromApi.first.animeDebut,
            japaneseVa: notesDetailsFromApi.first.japaneseVa,
            englishVa: notesDetailsFromApi.first.englishVa,
            stagePlay: notesDetailsFromApi.first.stagePlay,
          );
          await _itemRepository.syncToLocal(
            'item_detail', model);

          ImagesModel imagesModel = ImagesModel(
            itemId: itemId.toString(),
            imageUrl: notesDetailsFromApi.first.gallery!);
        await _itemRepository.syncImages('item_images', imagesModel);
      }

      final notesFromLocal = await _itemRepository.fetchItemsLocal();
      emit(ItemLoaded(notesFromLocal));
    } catch (e) {
      emit(ItemFailure(e.toString()));
    }
  }

  Future<void> getItemsLocal() async {
    try {
      emit(ItemLoading());
      final notesFromLocal = await _itemRepository.fetchItemsLocal();
      emit(ItemLoaded(notesFromLocal));
    } catch (e) {
      emit(ItemFailure(e.toString()));
    }
  }
}
