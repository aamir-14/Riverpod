import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_journey/state_notifier_provider/crud_operations/state_notifier_provider.dart';

class ItemScreen extends ConsumerStatefulWidget {
  const ItemScreen({super.key});

  @override
  ConsumerState<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends ConsumerState<ItemScreen> {
  @override
  Widget build(BuildContext context) {

    final item = ref.watch(itemProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers:[
          SliverAppBar(
            backgroundColor: Colors.black,
            
            pinned: true,
            elevation: 100,
            expandedHeight:100,
            flexibleSpace: FlexibleSpaceBar(
              title: Text( "CRUD Operations", style: TextStyle(color: Colors.white,),),
              background: Image(image: AssetImage("assets/soldier.jpg"),
              fit: BoxFit.fill,),
              
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 5,),
          ),
          item.isEmpty? SliverToBoxAdapter(child:Center(child: Text("NO RECORD FOUND"),))  :
          SliverList(
            
            delegate: SliverChildBuilderDelegate(
              
              (context, index) {
            final itemdetails = item[index];
                
          return Card(
            color: Colors.amber[100],
            borderOnForeground: true,
            elevation: 12,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(15)
            ),
            margin: EdgeInsets.all(3),

            child: ListTile(

            title: Text(itemdetails.name),
            subtitle: Text(itemdetails.id),


            autofocus: true,
            dense: false,
            focusColor: Colors.amber,
            isThreeLine: false,
            hoverColor: Colors.amber,

            trailing: PopupMenuButton(
              offset: Offset(0, 25),
              style: ButtonStyle(
                //backgroundColor: WidgetStatePropertyAll(Colors.amber[400])
              ),
              itemBuilder: (context)=>
              [
                
                PopupMenuItem(
                  onTap: () {
                    ref.read(itemProvider.notifier).updateitem(itemdetails.id, "Updated Item");
                  },
                  child: Text("Edit")),
                  PopupMenuItem(
                  onTap: () {
                    ref.read(itemProvider.notifier).deleteitem(itemdetails.id);
                  },
                  child: Text("Delete"))

              ]
            
            
              
            ),
          )
          ); 
          },childCount:item.length
          
          ),
          
          )
        ]
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read(itemProvider.notifier).addItems(
          "THis is Aamir"
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