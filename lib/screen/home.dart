import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_class_23/data/product_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
List cartItems = [];

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
            child: ListTile(
              tileColor: Colors.grey,
              title: Text(productData[index]["name"]),
              subtitle: Text(productData[index]["price"].toString()),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    
                  cartItems.add(productData[index]);
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ),
          );
        },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: const Icon(Icons.home),
          ),
    );
  }
}