import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework_example/example_locator.dart';
import 'package:clean_framework_example/ticker_lookup/model/ticker_lookup_api_config.dart' as _api_config;
import 'package:clean_framework_example/ticker_lookup/api/ticker_lookup_response_model.dart';

//FinnHub Dev API Key For Querying//
const String finnHubAPIKey = 'brk3rhnrh5r9g3otii9g';
//Ticker Quote API End Point//
const String tickerQuoteURL = 'stock/profile2?symbol=';
//Token Suffix Parameter - To be ammended to API End Point Request//
const String tokenParamSuffix = '&token=';

class TickerLookupService extends EitherService<JsonRequestModel,
    TickerLookupServiceResponseModel> {

  TickerLookupService(String tickerValue)
      : super(
      method: RestMethod.get,
      path: tickerQuoteURL + tickerValue + tokenParamSuffix + finnHubAPIKey,
      restApi: _api_config.SimpleRestApi()){
    logger().debug('TickerLookup ---> TickerLookupService : ' + path);
  }

  @override
  TickerLookupServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    logger().debug('TickerLookup ---> parseResponse : ' + jsonResponse.toString());
    return TickerLookupServiceResponseModel.fromJson(jsonResponse);
  }
}
