import 'package:flutter/material.dart';
import 'package:flutter_app/commons/screens/dashboard.dart';
//import 'package:permission/permission.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(ProductApp());
  //CustomerHttp()
  //    .findAll()
  //    .then((customers) => print('new customers $customers'));
} 

class ProductApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    requestPerm();
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

  requestPerm() async {
    try {

//      var pms = await Permission.requestSinglePermission(PermissionName.Location);
//      print(pms);


      var accessMediaLocation = Permission.locationWhenInUse;
      final status = await accessMediaLocation.request();

      print(status);

      //List<PermissionName> permissionNames = [];
      //permissionNames.add(PermissionName.Location);
      //permissionNames.add(PermissionName.Internet);


      //var permissions = await Permission.requestPermissions(permissionNames);
      //print(permissions);
//    permissions.forEach((permission) {
//      print('${permission.permissionName}: ${permission.permissionStatus}\n');
//    });
    } catch(e) {
        print(e);
    }
  }

}
