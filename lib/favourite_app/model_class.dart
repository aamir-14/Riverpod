


class Favouriteitems {

  final String item;
  final String id;
  final bool fav;
  

  Favouriteitems({ required this.fav, required this.id, required this.item});


  Favouriteitems copyWith({
    String? item,
    String? id,
    bool? fav,
    
  }) {
    return Favouriteitems(
      item: item ?? this.item,
      id:  id?? this.id,
      fav: fav ?? this.fav
     
    );
  }
}