import 'dart:async';
import 'dart:io';
import 'package:clean_framework/clean_framework.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

import '../../example_locator.dart';

//FinnHub Base URL//
const String finnHubURLBase = 'https://finnhub.io/api/v1/';

class SimpleRestApi extends RestApi {
  final baseUrl;

  HttpClient _httpClient;
  IOClient _ioClient;

  SimpleRestApi({this.baseUrl = finnHubURLBase}) {
    _httpClient = new HttpClient();
    _ioClient = new IOClient(_httpClient);
    logger().debug('TickerLookup ---> SimpleRestApi: ' + baseUrl);
  }

  @override
  Future<RestResponse> request(
      {RestMethod method,
        String path,
        Map<String, dynamic> requestBody = const {}}) async {
    assert(method != null && path != null && path.isNotEmpty);

    Response response;
    Uri uri = Uri.parse(baseUrl + path);
    logger().debug('TickerLookup ---> URI Request: ' + uri.toString());

    try {
      switch (method) {
        case RestMethod.get:
          logger().debug('TickerLookup ---> Request with GET method');
          response = await _ioClient.get(uri);
          logger().debug('TickerLookup ---> GET response: ' + response.body + ' : ' + response.statusCode.toString());
          break;
        case RestMethod.post:
            logger().debug('TickerLookup ---> Request with POST method: ' +
                uri.toString());
            response = await _ioClient.post(uri, body: requestBody);
          break;
        case RestMethod.put:
          logger().debug('TickerLookup ---> Request with PUT method');
          response = await _ioClient.put(uri, body: requestBody);
          break;
        case RestMethod.delete:
          logger().debug('TickerLookup ---> Request with DELETE method');
          response = await _ioClient.delete(uri);
          break;
        case RestMethod.patch:
          logger().debug('TickerLookup ---> Request with PATCH method');
          response = await _ioClient.patch(uri, body: requestBody);
          break;
      }

      return RestResponse<String>(type: RestResponseType.success, uri: uri, content: response.body,);
    }

    on ClientException {
      logger().debug('TickerLookup ---> REST Client Exception : ' + response.statusCode.toString());

      return RestResponse<String>(
        type: getResponseTypeFromCode(response.statusCode),
        uri: uri,
        content: response.body,
      );}
    catch (e) {
      logger().debug('TickerLookup ---> REST Error : '+ e.toString());
      logger().debug('TickerLookup ---> REST Error Request Body : ' + requestBody.toString());
      logger().debug('TickerLookup ---> REST Error Response : ' + response.toString());

      return RestResponse<String>(
        type: RestResponseType.unknown,
        uri: uri,
        content: '',
      );
    }
  }
}
