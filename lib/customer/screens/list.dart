import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/customer/http/customer_http.json.dart';
import 'package:flutter_app/customer/models/customer.dart';
import 'package:flutter_app/customer/screens/form.dart';

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
      body: FutureBuilder<List<Customer>> (
        future: CustomerHttp().findAll(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading')
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              final List<Customer> customers = snapshot.data;
              return ListView.builder(
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
              );
              break;
          }
          return Text("Unknow error");
        },
      ),
      appBar: AppBar(
        title: Text("Customers"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => this._showCustomerForm(context),
      ),
    );
  }

  void _showCustomerForm(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CustomerForm(),
      )
    );
  }

}