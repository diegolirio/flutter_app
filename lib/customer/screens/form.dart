import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/commons/components/edit.dart';
import 'package:flutter_app/customer/http/customer_http.json.dart';
import 'package:flutter_app/customer/models/customer.dart';

class CustomerForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomerFormState();
  }
}

class CustomerFormState extends State<CustomerForm> {

  final TextEditingController _nameTextEditController = TextEditingController();
  final TextEditingController _cpfCnpjTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Register the Customer"),),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Edit(
                controller: this._nameTextEditController,
                label: "name",
                hint: "Ex: Itau Unibanco SA",
              ),
              Edit(
                controller: this._cpfCnpjTextEditController,
                label: "cpfCnpj",
                hint: "Ex: 322151516516",
              ),
              RaisedButton(
                child: Text("Save"),
                onPressed: () => this._saveCustomer(context),
              )
            ],
          )
        ),
    );
  }

  void _saveCustomer(BuildContext context) {
    Customer customer = Customer(0,
        this._nameTextEditController.text,
        this._cpfCnpjTextEditController.text);
    CustomerHttp().save(customer).then((customer) => Navigator.pop(context));
  }

}
