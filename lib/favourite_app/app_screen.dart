import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_journey/favourite_app/provider.dart';

class FavouriteScreen extends ConsumerStatefulWidget {
  const FavouriteScreen({super.key});

  @override
  ConsumerState<FavouriteScreen> createState() => __FavouriteScreenStateState();
}

class __FavouriteScreenStateState extends ConsumerState<FavouriteScreen> {


  final itemcontroller = TextEditingController();
   bool isfav = false;
  
  @override
  Widget build(BuildContext context) {
    debugPrint("Whole Screen");

    final getitem = ref.watch(addfavourite);

    return Scaffold(
      appBar: AppBar(
        title: Text("Facourite"),
        backgroundColor: Colors.cyanAccent,
        bottomOpacity: 20,

        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              ref.read(addfavourite.notifier).selectitem(value);
            },
            itemBuilder: (BuildContext context){
            
            return const [

              PopupMenuItem(value:"All",
              child: Text("All")),

               PopupMenuItem(value:"Favourite",
              child: Text("Favourite"))
            ];
            
          },)
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                ref.read(addfavourite.notifier).searchitem(value);
              },
              
              decoration: InputDecoration(
                hintText: "Search Your Car",
            
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25)
                )
              ),
            ),
          ),
          
          Expanded(
            
            child: getitem.searchitems.isEmpty? Center(child: Text("NO DATA Found"),) :
            ListView.builder(
              itemCount: getitem.searchitems.length,
              itemBuilder: (context, index){
              
              final item = getitem.searchitems[index];
              return Card(
                child: ListTile(
            
                  title: Text(item.item),

                  trailing: Icon(item.fav? Icons.favorite : Icons.favorite_border),
        
            
                ),
              );
            }),
          )

        ],
      ),

      
      floatingActionButton: FloatingActionButton(onPressed: (){

        showDialog(context: context, builder: (context){
          return StatefulBuilder(builder: (context, setstateDialogue){
            return AlertDialog(
           // backgroundColor: const Color.fromARGB(31, 233, 233, 95),
            title: Text("Add Car Name"),
            content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                        controller: itemcontroller,
                        decoration: InputDecoration(hintText: "Enter Car Name",
                        hintStyle: TextStyle(color: Colors.white)
                        
                        ),
                        
                        
                      ),
                       CheckboxListTile(value: isfav, onChanged: (val){
                        setstateDialogue(() {
                           isfav = val!;
                        });
                        
                   },
                   title: Text("Favourite"),)
                ],
              
            ),
                
                actions: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Cancel")
                  ),

                  TextButton(onPressed: (){
                    ref.read(addfavourite.notifier).addfavitem(itemcontroller.text, isfav);
                    itemcontroller.clear();
                    
                    //Navigator.pop(context);
                  }, child: Text("Add")
                  ),

                
                ],
           
            
          );
          });
          
        }
        
        );

        
      },
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: 
          [
            const Color.fromARGB(255, 207, 183, 49).withAlpha(255),
            const Color.fromARGB(255, 239, 46, 46).withAlpha(255),
            const Color.fromARGB(255, 1, 196, 255).withAlpha(255),
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight
          )

        ),

        child: Icon(Icons.add, color: Colors.white,),
      )
    )

    );
  }
}