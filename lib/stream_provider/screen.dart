
import"package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_journey/stream_provider/stream_provider.dart";

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("Whole Screen");
    
    return Scaffold(
      body: Consumer(builder: (context, ref, child){
        final Provider = ref.watch(stream);
        return Center(
        child: Provider.when(data: (time)=> Text(
              "${time.hour}:${time.minute}:${time.second}",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
         error: (error, stack)=> Text(error.toString()),
          loading: ()=> Center(child: CircularProgressIndicator(),),)
      );
      }
      )
    );
  }
}