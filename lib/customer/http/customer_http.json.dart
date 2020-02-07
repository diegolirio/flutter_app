import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class CustomerHttp {

  void findAll() async {
    var httpClient = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
      final Response response = await httpClient.get('https://purchase-order-flutter.firebaseio.com/customers.json');
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