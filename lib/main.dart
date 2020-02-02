import 'package:flutter/material.dart';
import 'package:flutter_app/product/screens/list.dart';

void main() => runApp(ProductApp());

class ProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //theme: ThemeData.dark(),
        theme: ThemeData(
          primaryColor: Colors.orange[800],
          accentColor: Colors.blue[900],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blue[900],
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home: Scaffold(body: ProductList()));
  }
}
