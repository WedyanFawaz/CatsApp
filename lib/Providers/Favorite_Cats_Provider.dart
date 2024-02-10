import 'package:cats/model/cat_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteCatProvider extends StateNotifier<List<Cats>> {
  FavoriteCatProvider() : super([]);

  bool togglecatFavoriteStatus(Cats catType) {
    final catIsFavorite = state.contains(catType);

    if (catIsFavorite) {
      state = state.where((c) => c.name != catType.name).toList();
      return false;
    } else {
      state = [...state, catType];
      return true;
    }
  }
}
final favoriteCatsProvider =
    StateNotifierProvider<FavoriteCatProvider, List<Cats>>((ref) {
  return FavoriteCatProvider();
});
