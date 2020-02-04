import 'package:flutter_app/database/app_database.dart';
import 'package:flutter_app/product/models/product.dart';
import 'package:sqflite/sqflite.dart';

class ProductDao {

    static const String _tableName = 'products';
    static const String _id = 'id';
    static const String _name = 'name';
    static const String _price = 'price';

    // Future<int> save(Product product) {
    //   return createDatabase().then((db) {
    //     final Map<String, dynamic> prodcutMap = Map();
    //     prodcutMap['name'] = product.name;
    //     prodcutMap['price'] = product.price;
    //     return db.insert('products', prodcutMap);
    //   });
    // }

    Future<int> save(Product product) async {
      final Database db = await getDatabase();
      final Map<String, dynamic> prodcutMap = this._toMap(product);
      return db.insert(_tableName, prodcutMap);
    }
    
    // Future<List<Product>> findAll() {
    //   return createDatabase().then((db) {
    //     return db.query('products').then((maps) {
    //       final List<Product> products = List();
    //       for (Map<String, dynamic> map in maps) {
    //         final Product product = Product(
    //           map['id'],
    //           map['name'],
    //           map['price'],
    //         );
    //         products.add(product);
    //       }
    //       return products;
    //     });
    //   });
    // }

    Future<List<Product>> findAll() async {
      final Database db = await getDatabase();
      final List<Map<String, dynamic>> result = await db.query('products');
      final List<Product> products = _toList(result);
      return products;
    }

    Map<String, dynamic> _toMap(Product product) {
        final Map<String, dynamic> prodcutMap = Map();
        prodcutMap[_name] = product.name;
        prodcutMap[_price] = product.price;
        return prodcutMap;
    }

    List<Product> _toList(List<Map<String, dynamic>> result) {
        final List<Product> products = List();
        for(Map<String, dynamic> row in result) {
            final Product product = Product(row[_id], row[_name], row[_price]);
            products.add(product);
        }
        return products;
    }

}