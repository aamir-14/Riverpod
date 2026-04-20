import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_journey/future_provider/future_provider.dart';

class FutureScreen extends ConsumerWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(futureprovider);
    return Scaffold(

      appBar: AppBar(
        title: Text("Future Provider Widget"),
        backgroundColor: const Color.fromARGB(255, 110, 101, 101),
      ),

      body: data.when(skipLoadingOnRefresh: false,
        data: (value)=> ListView.builder(itemCount: value.length,
          itemBuilder: (context, index){
          return Center(child: Text(value[index]),);
        }),
        loading: (){ return Center(child: CircularProgressIndicator());},
         error: (erros , stack )=> TextButton(onPressed: (){
          ref.invalidate(futureprovider);
         }, child: Text(erros.toString()),),
          
          )

    );
  }
  
}

