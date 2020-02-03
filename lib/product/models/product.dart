class Product {

  final int _id;
  final String _name;
  final double _price;

  Product(this._id, this._name, this._price);

  int get id { return _id; }
  String get name { return _name; }
  double get price { return _price; }

  @override
  String toString() {
    return 'Product{_id: $_id _name: $_name, _price: $_price}';
  }
}