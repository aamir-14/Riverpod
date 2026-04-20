

import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureprovider = FutureProvider<List>((ref) async{

  await Future.delayed(Duration(seconds: 3));

  throw "intener Error";
 // return ["Aamir","Aamir","Aamir","Aamir","Aamir","Aamir"];
});