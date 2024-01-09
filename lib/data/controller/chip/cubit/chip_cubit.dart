// import 'package:flutter_bloc/flutter_bloc.dart';

// // import 'chip_state.dart';
// part 'chip_state.dart';

// class ChipCubit extends Cubit<ChipState> {
//   ChipCubit() : super(ChipState());

//   void toggleLike() {
//     emit(state.copyWith(isLiked: !state.isLiked));
//   }

//   void startAnimation() {
//     emit(state.copyWith(isHeartAnimating: true));
//   }

//   void stopAnimation() {
//     emit(state.copyWith(isHeartAnimating: false));
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikeCubit extends Cubit<Set<String>> {
  LikeCubit() : super(Set<String>());

  Future<void> toggleLike(String characterId) async {
    final prefs = await SharedPreferences.getInstance();
    final likes = prefs.getStringList('likes') ?? [];

    if (likes.contains(characterId)) {
      likes.remove(characterId);
    } else {
      likes.add(characterId);
    }

    await prefs.setStringList('likes', likes);
    emit(likes.toSet());
  }

  Future<void> loadLikes() async {
    final prefs = await SharedPreferences.getInstance();
    final likes = prefs.getStringList('likes') ?? [];
    emit(likes.toSet());
  }
}
