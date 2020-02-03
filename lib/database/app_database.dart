import 'package:flutter_app/product/models/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase(){
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'purchaseorder.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE products('
        'id INTEGER PRIMARY KEY, '
        'name TEXT, '
        'price REAL)');
    }, version: 1);
  });
}

Future<int> save(Product product) {
  return createDatabase().then((db) {
    final Map<String, dynamic> prodcutMap = Map();
    prodcutMap['name'] = product.name;
    prodcutMap['price'] = product.price;
    return db.insert('products', prodcutMap);
  });
}
 
Future<List<Product>> findAll() {
  return createDatabase().then((db) {
    return db.query('products').then((maps) {
      final List<Product> products = List();
      for (Map<String, dynamic> map in maps) {
        final Product product = Product(
          map['id'],
          map['name'],
          map['price'],
        );
        products.add(product);
      }
      return products;
    });
  });
}