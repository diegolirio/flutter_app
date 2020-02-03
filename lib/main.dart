import 'package:flutter/material.dart';
import 'package:flutter_app/commons/screens/dashboard.dart';
import 'package:flutter_app/database/app_database.dart';
import 'package:flutter_app/product/models/product.dart';

void main() {
  runApp(ProductApp());
  findAll().then((products) => debugPrint(products.toString()));  
} 

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
        home: Scaffold(body: Dashboard()));
  }
}
