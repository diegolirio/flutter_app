import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/product/models/product.dart';
import 'package:flutter_app/product/screens/form.dart';

class ProductList extends StatefulWidget {

  final List<Product> _products = List();

  @override
  State<StatefulWidget> createState() {
    return ProductListState();
  }
}

class ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget._products.length,
          itemBuilder: (context, index) {
            final product = widget._products[index];
            return ProductItem(product);
          }
      ),
      appBar: AppBar(
        title: Text("Products"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Product> future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProductForm();
          }));
          future.then((productRegistered) {

            // Future.delayed(Duration(seconds: 1), () { // TESTE

            if(productRegistered != null) {
              setState(() => widget._products.add(productRegistered));
            }
          });
        },
      ),
    );
  }

}

class ProductItem extends StatelessWidget {
  final Product _product;

  ProductItem(this._product);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(this._product.name),
          subtitle: Text(this._product.price.toString()),
        ));
  }
}