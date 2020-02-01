import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: ProductList(),
          appBar: AppBar(
              title: Text("Products"),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
          ),
        ),
      )
);


class ProductList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Product("Iphone X", 3000.99),
        Product("Notebook", 59000.99),
      ],
    );
  }
}

class Product extends StatelessWidget {

  final String _name;
  final double _price;

  Product(this._name, this._price);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(this._name),
          subtitle: Text(this._price.toString()),
        )
    );
  }


}