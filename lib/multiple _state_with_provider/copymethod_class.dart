

import 'package:riverpod/legacy.dart';

final sliderProvider = StateProvider<Multiple>((ref){
  return Multiple(slider: 0.1, password: true);
}
);


class Multiple{
   
   final double slider;
   final bool password;

   Multiple({required this.slider, required this.password});

 Multiple copyWith({
  double? slider,
  bool? password
 })
 {
 return Multiple(
  slider: slider ?? this.slider,
  password: password ?? this.password
  );
 }
}