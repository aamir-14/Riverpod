

//import 'dart:math';

import 'package:riverpod/riverpod.dart';

final stream = StreamProvider<DateTime>((ref) async*{

//final random = Random();



while (true){
await Future.delayed(Duration(seconds: 1));
yield DateTime.now();

}



}
);


//while(true){
//   await Future.delayed(Duration(seconds: 1));

//   currentPrice += random.nextDouble() * 4 -2;
//   yield double.parse(currentPrice.toString());
// }