

import 'package:riverpod_journey/favourite_app/model_class.dart';

class FavouriteState {
  final List<Favouriteitems> allitems;
  final List<Favouriteitems> searchitems;
  final String search;

  FavouriteState({required this.allitems, required this.searchitems, required this.search});


  FavouriteState copyWith({
   List<Favouriteitems>? allitems,
   List<Favouriteitems>? searchitems,
   String? search,
  })
  {
    return FavouriteState(
      allitems: allitems?? this.allitems,
     searchitems: searchitems?? this.searchitems,
      search: search?? this.search
      );
  }
}
