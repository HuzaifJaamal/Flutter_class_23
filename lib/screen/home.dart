import 'package:flutter/material.dart';
import 'package:flutter_class_23/data/product_list.dart';
import 'package:flutter_class_23/screen/cart_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
List cartItems = [];
List favouriItems = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cartItems.length.toString()),
      ),
      body: ListView.builder(
        itemCount: productData.length,
        itemBuilder: (context,index){
          return Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Column(
              children: [
                ListTile(
                  tileColor: Colors.grey,
                  title: Text(productData[index]["name"]),
                  subtitle: Text(productData[index]["price"].toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            
                          cartItems.add(productData[index]);
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if(productData[index]["isFav"]== true){
                              productData[index]["isFav"] = false;
                              favouriItems.remove(productData[index]);
                            }else{
                              productData[index]["isFav"] = true;
                              favouriItems.add(productData[index]);
                            }
                          });
                        },
                        icon: const Icon(Icons.favorite),
                        color: productData[index]["isFav"]
                        ?Colors.red
                        :Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
          await Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> CartView(
                items: cartItems,
              )));
              setState(() {});
          },
          child: const Icon(Icons.home),
          ),
    );
  }
}