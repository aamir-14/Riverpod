
// state StateNotifier SearchProvider

import 'package:flutter_riverpod/legacy.dart';

final itemProvider= StateNotifierProvider<Getitems, List<Items>>((ref){
  return Getitems();
}
);


class Getitems extends StateNotifier<List<Items>>{

  Getitems(): super ([]);

  void addItems (String name){

    final item = Items(id: DateTime.now().toString(), name: name);
    state.add(item);
    state = state.toList();

  }

  void deleteitem (String id){

    state.removeWhere((Items)=>Items.id == id);
    state = state.toList();
  }

   void updateitem (String id,String name,){
   int  foundindex = state.indexWhere((Items)=> Items.id == id, );
    state[foundindex].id = DateTime.now().toString();
   state[foundindex].name = name;
  
    
    state = state.toList();
  }
}






// Model Class 
class Items{
  String  id;
  String name;

  Items({required this.id, required this.name});
}