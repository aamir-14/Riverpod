

import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_journey/favourite_app/favourite_state.dart';
import 'package:riverpod_journey/favourite_app/model_class.dart';

final addfavourite = StateNotifierProvider<ItemProvider, FavouriteState >((ref){
  return ItemProvider();
}
);

class ItemProvider extends StateNotifier<FavouriteState>{
 ItemProvider() : super (FavouriteState(allitems: [], searchitems: [], search: " "));
 

 void addfavitem(String name, bool fav){
  final item = Favouriteitems(fav: fav , id: DateTime.now().toString(), item: name );

  final updatedList = [...state.allitems, item];
  state = state.copyWith(allitems: updatedList,searchitems: updatedList);
  
 }

 void searchitem(String search){
  state = state.copyWith(
    search: search,
    searchitems: filteritems(state.allitems, search));

 }

 List<Favouriteitems> filteritems (List<Favouriteitems> caritem, String search){
   if(search.isEmpty){
    return caritem;
   }
   return caritem.
   where((item)=> item.item.toLowerCase().contains(search.toLowerCase())).toList();
 }

 void selectitem (String option){
  state = state.copyWith(
    
    searchitems: _filteritems(state.allitems, option));

 }

 List<Favouriteitems> _filteritems (List<Favouriteitems> caritem, String option){
   if(option == "All"){
    return caritem;
   }
   return caritem.
   where((item)=> item.fav == true).toList();
 }

 
}
