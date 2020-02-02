import 'package:flutter/material.dart';

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
              child: Image.asset('images/servicos.jpg'), //Image.network('https://www.sepsancho.com/wp-content/uploads/servi%C3%A7os.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 100,
                  width: 150,
                  color: Theme.of(context).accentColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.category, color: Colors.white, size: 24), 
                      Text('Products', style: TextStyle(color: Colors.white, fontSize: 16),),
                  ])
              ),
            ),
        ]
      ),
    );
  }
}