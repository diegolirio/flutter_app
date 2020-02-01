import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: ProductForm()
      )
);

class ProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductList(),
      appBar: AppBar(
        title: Text("Products"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ProductForm extends StatelessWidget {

  final TextEditingController _nameTextEditingController = TextEditingController();
  final TextEditingController _priceTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Register your Product")),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: this._nameTextEditingController,
                style: TextStyle(
                  fontSize: 24,
                ),
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Ex: IPhone XS"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _priceTextEditingController,
                style: TextStyle(
                  fontSize: 24,
                ),
                decoration: InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: "Price",
                    hintText: "Ex: 9.99"
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () {
                String name = _nameTextEditingController.text;
                double price = double.tryParse(_priceTextEditingController.text);
                if(price == null || name == "") {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: new Text("Name and price are invalid"),
                          //content: new Text("Alert Dialog body"),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                              child: new Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      }
                    );

                }
                Product(name, price);
              },
            )
          ],
        ),
    );
  }

}

class ProductList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProductItem(Product("Iphone X", 3000.99)),
        ProductItem(Product("Notebook", 59000.99)),
      ],
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
          title: Text(this._product._name),
          subtitle: Text(this._product._price.toString()),
        )
    );
  }
}

class Product {

  final String _name;
  final double _price;

  Product(this._name, this._price);

}