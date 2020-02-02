class Product {
  final String _name;
  final double _price;

  Product(this._name, this._price);

  String get name { return _name; }
  double get price { return _price; }

  @override
  String toString() {
    return 'Product{_name: $_name, _price: $_price}';
  }
}