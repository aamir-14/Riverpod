import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_journey/state_notifier_provider/search_provider.dart';



class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("WHole");
      return Scaffold(
        appBar: AppBar(
          title: Text("State notifier"),
        ),

        body: SingleChildScrollView(
          child: Consumer( builder: (context, ref, child){
            debugPrint("Main");

            final changer = ref.watch(searchProvider.select((State)=>State.onoff));
            return Container(
              decoration: BoxDecoration(
                color: changer? Colors.black : Colors.white
              ),
                 
              child: Column(
                children: [
                  TextField(
                    onChanged: (value){
                      ref.read(searchProvider.notifier).search(value);
                    },
                  ),
                  Consumer(builder: (context, ref, child){
                    debugPrint("Main");
                    final srch = ref.watch(searchProvider.select((State)=>State.search));
                    return Text(srch);
                  }),
              
                   Consumer( builder: (context, ref, child){
                  debugPrint("Hero");
                  final slider = ref.watch(searchProvider.select((State)=> State.onoff));
                  return
                  InkWell(
                    onTap: (){
                       final StateProvider = ref.read(searchProvider.notifier);
                      StateProvider.state = StateProvider.state.copyWith( cont: !slider );
                    },
                    child: Container(
                      height: 200,
                      width: 215,
                      decoration: BoxDecoration(
                        
                          
                       color: slider ? const Color.fromARGB(255, 234, 221, 82) : Colors.red,
                       border: Border.all(color: Colors.black),
                       borderRadius: BorderRadius.circular(150)
                      ),
                     
                    ),
                  );
                }
                ),
              
                Consumer(builder: (context, ref, child){
                  debugPrint("Last");
              
                  final watch = ref.watch(searchProvider.select((State)=>State.onoff));
              
                  return Center(
                    child:  Switch(value: watch, onChanged: (value){
              
                      final stateNotifier = ref.read(searchProvider.notifier);
                      stateNotifier.state = stateNotifier.state.copyWith(onoff: value);
              
                    }),
                  );
                }),
                SizedBox(height: 20,
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black.withValues(alpha: 0.5),
                      const Color.fromARGB(255, 162, 27, 27).withValues(alpha: 0.5),
                      const Color.fromARGB(255, 219, 178, 14).withValues(alpha: 0.5),
                      const Color.fromARGB(255, 50, 4, 216).withValues(alpha: 0.5),
                      const Color.fromARGB(255, 2, 233, 217).withValues(alpha: 0.5),

                    ]
                    ),
                    borderRadius: BorderRadius.circular(130)
                  ),
                )
                ],
              ),
            );
          }
          ),
        ),
      );
  }
}