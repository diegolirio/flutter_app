import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

    final String createTableProducts = 
                    'CREATE TABLE products('
                      'id INTEGER PRIMARY KEY, '
                      'name TEXT, '
                      'price REAL)';

// Future<Database> createDatabase(){
//   return getDatabasesPath().then((dbPath) {
//     final String path = join(dbPath, 'purchaseorder.db');
//     return openDatabase(path, onCreate: (db, version) {
//       db.execute('CREATE TABLE products('
//         'id INTEGER PRIMARY KEY, '
//         'name TEXT, '
//         'price REAL)');
//     }, version: 1,
//        //onDowngrade: onDatabaseDowngradeDelete
//     );
//   });
// }

Future<Database> getDatabase() async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, 'purchaseorder.db');
    return openDatabase(path, onCreate: (db, version) {
        db.execute(createTableProducts);
    }, version: 1);
}