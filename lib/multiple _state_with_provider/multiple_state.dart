import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_journey/multiple%20_state_with_provider/copymethod_class.dart';


class MultipleStateProvider extends ConsumerStatefulWidget {
  const MultipleStateProvider({super.key});

  @override
  ConsumerState<MultipleStateProvider> createState() => _MultipleStateProviderState();
}

class _MultipleStateProviderState extends ConsumerState<MultipleStateProvider> {
  @override
  Widget build(BuildContext context,) {
   
  
    
    return Scaffold(

      appBar: AppBar(
        title: Text("Handling Multiple States"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          Consumer( builder: (context, ref, child){
            debugPrint("Hero");
            final slider = ref.watch(sliderProvider.select((State)=> State.password));
            return
            InkWell(
              onTap: (){
                 final StateProvider = ref.read(sliderProvider.notifier);
                StateProvider.state = StateProvider.state.copyWith( password: !slider );
              },
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                 color: slider ? Colors.black : Colors.red,
                ),
               
              ),
            );
          }
          ),


          Consumer( builder: (context, ref, child){
            final slider = ref.watch(sliderProvider.select((state)=> state.slider));
            return
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.amber.withValues(alpha: slider)
              ),
            );
          }
          ),
          Consumer(builder: (context, ref, child){
            debugPrint("Helo");
             final slider = ref.watch(sliderProvider.select((state)=> state.slider));
            return Center(
              child: Slider(value: slider, onChanged: (value){
                final StateProvider = ref.read(sliderProvider.notifier);
                StateProvider.state = StateProvider.state.copyWith(slider: value);
              }),
            );
          }
          )
          
        ],
      )
    );
  }
}