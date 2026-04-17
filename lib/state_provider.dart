import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';


final count = StateProvider<int>((ref){
  return 0;
});

final swit = StateProvider<bool>((ref){
  return false;
});





class ProviderState extends ConsumerStatefulWidget {
  const ProviderState({super.key});

  @override
  ConsumerState<ProviderState> createState() => _ProviderStateState();
}

class _ProviderStateState extends ConsumerState<ProviderState> {
  @override
  Widget build(BuildContext context) {
  
 return  Scaffold(
      appBar: AppBar(
        title: Text(
          "RiverPod",
          style: TextStyle(fontSize: 20, fontWeight: .bold),
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            
            Consumer(builder: (context, ref, child){
              final rf = ref.watch(count);
            return Center(
              child:  Text(rf.toString(), style: TextStyle(fontSize: 40),),
            );
            }),

            Consumer(builder: (context, ref, child){
              final _ref = ref.watch(swit);
              debugPrint("Switch");
              return Switch(value: _ref, onChanged: (value){

                ref.read(swit.notifier).state = value;

              });
            }),

SizedBox(height: 20,),
            Row(
              mainAxisAlignment: .center,
              children: [
                ElevatedButton(onPressed: (){
              debugPrint("Increase");

              ref.read(count.notifier).state ++;

            }, child: Text("+")),

            SizedBox(width: 20,),

             ElevatedButton(onPressed: (){
              debugPrint("Decrease");

              ref.read(count.notifier).state --;

            }, child: Text("-"))
              ],
            )

          ],
        )
        ),
      
    );

  
}

}



// // State Provider with StatelessWidget
// class ProviderState extends ConsumerWidget {
//   const ProviderState({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
   
//     print("Outer Build");
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "RiverPod",
//           style: TextStyle(fontSize: 20, fontWeight: .bold),
//         ),
//         backgroundColor: Colors.amber,
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           children: [
            
//             Consumer(builder: (context, ref, child){
//               final rf = ref.watch(count);
//             return Center(
//               child:  Text(rf.toString(), style: TextStyle(fontSize: 40),),
//             );
//             }),

//             Consumer(builder: (context, ref, child){
//               final _ref = ref.watch(swit);
//               print("Switch");
//               return Switch(value: _ref, onChanged: (value){

//                 ref.read(swit.notifier).state = value;

//               });
//             }),

// SizedBox(height: 20,),
//             Row(
//               mainAxisAlignment: .center,
//               children: [
//                 ElevatedButton(onPressed: (){
//               print("Increase");

//               ref.read(count.notifier).state ++;

//             }, child: Text("+")),

//             SizedBox(width: 20,),

//              ElevatedButton(onPressed: (){
//               print("Decrease");

//               ref.read(count.notifier).state --;

//             }, child: Text("-"))
//               ],
//             )

//           ],
//         )
//         ),
      
//     );
//   }
  
// }
