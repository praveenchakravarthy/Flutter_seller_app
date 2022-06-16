
part of 'apis.dart';

class _$ApiService extends ApiService {

  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiService;

  @override
  Future<Response> sendLoginOtp(Map<String, dynamic> data) {
    // TODO: implement sendLoginOtp
    throw UnimplementedError();
  }

  @override
  Future<Response> subscriptionPlanList(Map<String, dynamic> data) {
    const $url = '/subscription-plans/sellers';
    final $body = data;
    final $request = Request('POST', $url, client.baseUrl, headers: const {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiRGVlcGFrIFN3YWluIiwiaWQiOjEsImVtYWlsIjoiZGVlcGFrLnN3YWluQHJlYWR5YXNzaXN0LmluIiwibW9iaWxlTm8iOiI3MDA4NTA3MzYxIiwiUm9sZU5hbWUiOiJBZG1pbiIsInZlbmRvcklkIjpudWxsLCJpYXQiOjE2NTQ4NTEwNDgsImV4cCI6MTY1NzQ0MzA0OH0.6dEbAtJz7ahpvnrb6jxq6a64Bf0VTsWIFYcafR0QuB4',
    }, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> verifyLoginOtp(Map<String, dynamic> data) {
    // TODO: implement verifyLoginOtp
    throw UnimplementedError();
  }

  @override
  Future<Response> validateCoupon(Map<String, dynamic> data) {
    const $url = '/seller-coupons/validateSeller';
    final $query = data;
    final $request = Request('GET', $url, client.baseUrl, headers: const {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiRGVlcGFrIFN3YWluIiwiaWQiOjEsImVtYWlsIjoiZGVlcGFrLnN3YWluQHJlYWR5YXNzaXN0LmluIiwibW9iaWxlTm8iOiI3MDA4NTA3MzYxIiwiUm9sZU5hbWUiOiJBZG1pbiIsInZlbmRvcklkIjpudWxsLCJpYXQiOjE2NTQ4NTEwNDgsImV4cCI6MTY1NzQ0MzA0OH0.6dEbAtJz7ahpvnrb6jxq6a64Bf0VTsWIFYcafR0QuB4',
    }, parameters: $query);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> getActivePlans(Map<String, dynamic> parameters) {
    const $url = '/subscription-plans?filter=';
    final $query = parameters;
    final $request = Request('GET', $url, client.baseUrl, headers: const {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiRGVlcGFrIFN3YWluIiwiaWQiOjEsImVtYWlsIjoiZGVlcGFrLnN3YWluQHJlYWR5YXNzaXN0LmluIiwibW9iaWxlTm8iOiI3MDA4NTA3MzYxIiwiUm9sZU5hbWUiOiJBZG1pbiIsInZlbmRvcklkIjpudWxsLCJpYXQiOjE2NTQ4NTEwNDgsImV4cCI6MTY1NzQ0MzA0OH0.6dEbAtJz7ahpvnrb6jxq6a64Bf0VTsWIFYcafR0QuB4',
    }, parameters: $query);
    print($request);
    return client.send<dynamic, dynamic>($request);
  }


}

