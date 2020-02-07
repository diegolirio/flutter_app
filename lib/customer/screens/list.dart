import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/customer/models/customer.dart';

class CustomerList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ProductListState();

  }

}

class ProductListState extends State<CustomerList> {

  final List<Customer> customers = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: ListView.builder(
           itemCount: customers.length,
           itemBuilder: (context, index) {
                final Customer customer = customers[index];
                return Card(
                  child: ListTile(
                      leading: Icon(Icons.monetization_on),
                      title: Text(customer.name),
                      subtitle: Text(customer.cpfCnpj),
                  )
                );
           }
       ),
      appBar: AppBar(
        title: Text("Customers"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => debugPrint("32a1vdfsb"),
      ),
    );
  }

}