import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/product/dao/product_dao.dart';
import 'package:flutter_app/product/models/product.dart';
import 'package:flutter_app/product/screens/form.dart';

class ProductList extends StatefulWidget {

  //final List<Product> _products = List();

  @override
  State<StatefulWidget> createState() {
    return ProductListState();
  }
}

class ProductListState extends State<ProductList> {

  final ProductDao _dao = ProductDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView.builder(
      //     itemCount: widget._products.length,
      //     itemBuilder: (context, index) {
      //       final product = widget._products[index];
      //       return ProductItem(product: product);
      //     }
      // ),
      body: FutureBuilder<List<Product>>(
        initialData: List(),
        //future: findAll(),
        future: Future.delayed(Duration(seconds: 1)).then((value) => this._dao.findAll()),
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
              case ConnectionState.none: break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text('Loading'),
                    ],
                  ),
                );            
                break;  
              case ConnectionState.active: break;
              case ConnectionState.done:
                final List<Product> products = snapshot.data;
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductItem(product: product); 
                  }
                );            
                break;            
          }
          return Text('Unkown error');
        },
      ),
      appBar: AppBar(
        title: Text("Products"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //final Future<Product> future = 
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProductForm();
          }));
          
          //future.then((productRegistered) {
            // Future.delayed(Duration(seconds: 1), () { // TESTE
          //  if(productRegistered != null) {
              // setState(() => widget._products.add(productRegistered));
          //    setState(() => debugPrint(productRegistered.toString()));
          //  }
          //});
        },
      ),
    );
  }

}

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(this.product.name),
          subtitle: Text(this.product.price.toString()),
        ));
  }
}