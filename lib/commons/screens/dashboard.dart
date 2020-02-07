import 'package:flutter/material.dart';
import 'package:flutter_app/customer/screens/list.dart';
import 'package:flutter_app/product/screens/list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/6746123_preview.png'),
          ),
          Row(
            children: <Widget>[
              _FeatureItem('Products', Icons.category, onClick: () => this._showProductList(context),),
              _FeatureItem('Customers', Icons.supervised_user_circle, onClick: () => this._showCustomerList(context),),
            ],
          ),
        ],
      ),
    );
  }

  void _showProductList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductList(),
      ),
    );
  }

  void _showCustomerList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CustomerList(),
      ),
    );
  }


}

class _FeatureItem extends StatelessWidget {

  final String _name;
  final IconData _icon;
  final Function onClick;

  _FeatureItem(this._name, this._icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Material(
          color: Theme.of(context).accentColor,
          child: InkWell(
            onTap: () => this.onClick(),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 100,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(this._icon, color: Colors.white, size: 24),
                  Text(
                    this._name,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
