import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ProductApp()));

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
        onPressed: () {
          final Future<Product> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProductForm();
          }));
          future.then((productRegistered) {
            debugPrint("=======================");
            debugPrint("$productRegistered");
          });
        },
      ),
    );
  }
}

class ProductForm extends StatelessWidget {
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _priceTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register your Product")),
      body: Column(
        children: <Widget>[
          Edit(
            controller: _nameTextEditingController,
            label: "Name",
            hint: "Ex: IPhone Xs",
          ),
          Edit(
            controller: _priceTextEditingController,
            label: "Price",
            hint: "9,99",
            icon: Icons.monetization_on,
            textInputType: TextInputType.number,
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () => this._saveProduct(context),
          )
        ],
      ),
    );
  }

  _saveProduct(BuildContext context) {
    String name = _nameTextEditingController.text;
    double price = double.tryParse(_priceTextEditingController.text);
    if (price == null || name == "") {
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
          });
      return;
    }
    final product = Product(name, price);
    Navigator.pop(context, product);
  }
}

class Edit extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType textInputType;

  Edit({this.controller, this.label, this.hint, this.icon, this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: this.controller,
        style: TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: this.label,
          hintText: this.hint,
          icon: this.icon != null ? Icon(this.icon) : null,
        ),
        keyboardType: this.textInputType,
      ),
    );
  }
}

class ProductList extends StatelessWidget {

  final List<Product> _products = List();

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
            final product = _products[index];
            return ProductItem(product);
        }
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
    ));
  }
}

class Product {
  final String _name;
  final double _price;

  Product(this._name, this._price);

  @override
  String toString() {
    return 'Product{_name: $_name, _price: $_price}';
  }
}
