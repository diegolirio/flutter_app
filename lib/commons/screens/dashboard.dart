import 'package:flutter/material.dart';
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
              child: Image.asset('6746123_preview.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Material(
                  color: Theme.of(context).accentColor,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductList(),
                        ), 
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      height: 100,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.category, color: Colors.white, size: 24), 
                          Text('Products', style: TextStyle(color: Colors.white, fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
              ),
            ),
          )
        ],
      ),
    );
  }
}