import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/commons/components/edit.dart';
import 'package:flutter_app/product/dao/product_dao.dart';
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

final ProductDao _dao = ProductDao();

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
              hint: "Ex: iPhone Xs",
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
      showAlert();
      return;
    }
    final product = Product(0, name, price);
    //Navigator.pop(context, product);
    this._dao.save(product).then((id) => Navigator.pop(context));
  }

  showAlert() {
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
  }

}