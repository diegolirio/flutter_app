import 'dart:convert';

import 'package:flutter_app/customer/models/customer.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class CustomerHttp {

  static const String URL_CUSTOMER = 'http://192.168.0.103:8080/customers';
  Map<String, String> HEADERS = {'Content-type' : 'application/json'};

  Future<List<Customer>> findAll() async {
      HttpClientWithInterceptor httpClient = this.getHttpInterceptor();
      //final Response response = await httpClient.get('https://purchase-order-flutter.firebaseio.com/customers.json');
      final Response response = await httpClient.get(URL_CUSTOMER);
      final List<dynamic> decodedJson = jsonDecode(response.body);
      final List<Customer> customers = List();
      for(Map<String, dynamic> element in decodedJson){
          Customer customer = toCustomer(element);
          customers.add(customer);
      }
      return customers;
  }

  Future<Customer> save(Customer customer) async {
    HttpClientWithInterceptor httpClient = this.getHttpInterceptor();

    final Map<String, dynamic> customerMap = {
      'name': customer.name,
      'cpfCnpj': customer.cpfCnpj
      };    
    
    String customerJson = jsonEncode(customerMap);

    final Response response = await httpClient.post(URL_CUSTOMER,
                headers: HEADERS,
                body: customerJson);

    Map<String, dynamic> json = jsonDecode(response.body);
    return toCustomer(json);
  }

  Customer toCustomer(Map<String, dynamic> element) {
    return Customer(element["id"], element["name"], element["cpfCnpj"]);
  }

  HttpClientWithInterceptor getHttpInterceptor() {
    return HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  }



}

class LoggingInterceptor implements InterceptorContract {

  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request');
    print('url ${data.url}');
    print('headers ${data.headers}');
    print('body ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Response');
    print('status code: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
  
}