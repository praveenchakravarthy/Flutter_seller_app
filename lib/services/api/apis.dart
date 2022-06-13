import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;
import 'dart:io';
part 'apis.chopper.dart';

const String remoteUrl = 'http://dev.readyassist.net/api';


@ChopperApi()
abstract class ApiService extends ChopperService {

  @Post(path: '/user/sendLoginOtp')
  Future<Response> sendLoginOtp(@Body() Map<String, dynamic> data);

  @Post(path: '/user/verifyLoginOtp')
  Future<Response> verifyLoginOtp(@Body() Map<String, dynamic> data);

  @Post(path: '/subscription-plans/sellers')
  Future<Response> subscriptionPlanList(@Body() Map<String, dynamic> data);


  static ApiService create() {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final client = ChopperClient(
      baseUrl: remoteUrl,
      services: [_$ApiService()],
      converter: const JsonConverter(),
      interceptors: [HttpLoggingInterceptor()],
      client: http.IOClient(ioc),
      // client: http.IOClient(
      //   HttpClient()..connectionTimeout = const Duration(seconds: 90),
      // ),
    );
    return _$ApiService(client);
  }
}
