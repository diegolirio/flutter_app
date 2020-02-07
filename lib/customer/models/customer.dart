class Customer {

  final String _id;
  final String _name;
  final String _cpfCnpj;

  Customer(this._id, this._name, this._cpfCnpj);

  String get name { return this._name; }
  String get cpfCnpj { return this._cpfCnpj; }

}