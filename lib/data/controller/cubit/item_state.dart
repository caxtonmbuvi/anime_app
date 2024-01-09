part of 'item_cubit.dart';

@immutable
sealed class ItemState {}

final class ItemInitial extends ItemState {}

final class ItemLoading extends ItemState {}

final class ItemLoaded extends ItemState {
  final List<ItemDetailLocalModel> data;

  ItemLoaded(this.data);
}

final class ItemFailure extends ItemState {
  final String message;

  ItemFailure(this.message);
}
