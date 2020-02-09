class Customer {

  final int _id;
  final String _name;
  final String _cpfCnpj;

  Customer(this._id, this._name, this._cpfCnpj);

  String get name { return this._name; }
  String get cpfCnpj { return this._cpfCnpj; }

  @override
  String toString() {
    return 'Customer{_id: $_id, _name: $_name, _cpfCnpj: $_cpfCnpj}';
  }


}