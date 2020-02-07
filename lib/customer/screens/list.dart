import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomerList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ProductListState();

  }

}

class ProductListState extends State<CustomerList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Customer"),
    );
  }

}