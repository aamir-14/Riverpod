
import 'package:flutter_riverpod/legacy.dart';

final searchProvider = StateNotifierProvider <SearchProvider, Search> ((ref){
  
  return SearchProvider();
}
);


class SearchProvider extends StateNotifier<Search> {
SearchProvider() : super(Search(search: " ", cont: false, onoff: false));

void search (String query){
  state = state.copyWith(search: query);
}

void onChanged(bool ischange){
  state = state.copyWith(cont: ischange);
}
void changer(bool onoff){
  state =state.copyWith(onoff: onoff);
}


}



class Search {
  final String search;
  final bool cont;
  final bool onoff;


  Search({ required this.search, required this.cont , required this.onoff});

  Search copyWith({
  
    String? search,
    bool? cont,
    bool? onoff,
  })
   {
    return Search(
     search: search?? this.search,
     cont: cont ?? this.cont,
     onoff: onoff?? this.onoff,
    );
  }

}