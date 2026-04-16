import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';




final vari = Provider<String>((ref){
  return "My name is Aamir Iqbal";
});


final age = Provider<int>((ref){
  return 25;
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
 ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

      
  @override
  Widget build(BuildContext context) {
    final refrence = ref.watch(vari);
   final ag = ref.watch(age);

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
        child: Column(children: [

          Text(refrence +" "+ag.toString(),
         style: TextStyle(fontSize: 40, fontWeight: .bold),),

         SizedBox(height: 40,),

         ElevatedButton(onPressed: (){
          print("Hello");
         }, child: Text("press me"))


        ] ),
      ),
    );
  }
}



// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {

//     final refrence = ref.watch(vari);
//     final ag = ref.watch(age);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("RiverPod"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Text(refrence +" "+ag.toString()),
//       ),
//     );
//   }
// }