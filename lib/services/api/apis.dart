import 'package:chopper/chopper.dart';
import 'package:flutter_app/services/api/header_interceptor.dart';
import 'package:http/io_client.dart' as http;
import 'dart:io';
part 'apis.chopper.dart';

const String remoteUrl = 'http://dev.readyassist.net/api';


@ChopperApi()
abstract class ApiService extends ChopperService {

  /*Signin page*/
  @Post(path: '/seller-otp-verifications/mobile/sendOtp')
  Future<Response> sendLoginOtp(@Body() Map<String, dynamic> data);

  @Post(path: '/seller-otp-verifications/mobile/login')
  Future<Response> verifyLoginOtp(@Body() Map<String, dynamic> data);

  /*Home Page*/
  @Post(path: '/sellers/dashboard')
  Future<Response> dashboardDetails(@Body() Map<String, dynamic> data);

  @Post(path: '/seller-coupons/validateSeller')
  Future<Response> validateCoupon(@Body() Map<String, dynamic> data);


  /*Plans*/
  @Post(path: '/subscription-plans/sellers')
  Future<Response> subscriptionPlanList(@Body() Map<String, dynamic> data);

  @Get(path: '/subscription-plans')
  Future<Response> getActivePlans(@QueryMap() Map<String, dynamic> parameters);


  static ApiService create() {
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final client = ChopperClient(
      baseUrl: remoteUrl,
      services: [_$ApiService()],
      converter: const JsonConverter(),
      interceptors: [HeaderInterceptor(), HttpLoggingInterceptor()],
      client: http.IOClient(ioc),
      // client: http.IOClient(
      //   HttpClient()..connectionTimeout = const Duration(seconds: 90),
      // ),
    );
    return _$ApiService(client);
  }
}
