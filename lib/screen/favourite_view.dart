import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  final List items;
  const CartView({super.key, required this.items});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart View"),
      ),
      body: widget.items.isEmpty
      ? const Center(child: Text("Empty Cart")) :
      ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text("${widget.items[index]["name"]}"),
            subtitle: Text("${widget.items[index]["price"]}"),
            trailing: ElevatedButton(
              onPressed: (){
                setState(() {
                  widget.items.removeAt(index);
                });
              }, 
              child: Text("-")),
          );
        }),
    );
  }
}