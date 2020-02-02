import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/edit.dart';
import 'package:flutter_app/product/models/product.dart';

class ProductForm extends StatefulWidget {

  final TextEditingController _nameTextEditingController = TextEditingController();
  final TextEditingController _priceTextEditingController = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return ProductFormState();
  }
}

class ProductFormState extends State<ProductForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register your Product")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Edit(
              controller: widget._nameTextEditingController,
              label: "Name",
              hint: "Ex: IPhone Xs",
            ),
            Edit(
              controller: widget._priceTextEditingController,
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
      ),
    );
  }

  _saveProduct(BuildContext context) {
    String name = widget._nameTextEditingController.text;
    double price = double.tryParse(widget._priceTextEditingController.text);
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