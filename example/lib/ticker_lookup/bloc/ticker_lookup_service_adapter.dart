import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import '../../example_locator.dart';
import '../api/ticker_lookup_response_model.dart';
import '../api/ticker_lookup_service.dart';
import '../model/ticker_lookup_entity.dart';

class TickerLookupServiceAdapter extends ServiceAdapter<TickerLookupEntity,
    JsonRequestModel, TickerLookupServiceResponseModel, TickerLookupService> {
  String tickerValue;

  TickerLookupServiceAdapter(String tickerValue) : super(TickerLookupService(tickerValue)){
    this.tickerValue = tickerValue;
  }

  @override
  TickerLookupEntity createEntity(TickerLookupEntity initialEntity,
      TickerLookupServiceResponseModel tickerLookupServiceResponseModel) {
    logger().debug('TickerLookup ---> TickerLookupEntity createEntity');
    return initialEntity.merge(
        errors: <EntityError>[],
        country: tickerLookupServiceResponseModel.country,
        currency: tickerLookupServiceResponseModel.currency,
        exchange: tickerLookupServiceResponseModel.exchange,
        industry: tickerLookupServiceResponseModel.industry,
        ipoDate: tickerLookupServiceResponseModel.ipoDate,
        logoURL: tickerLookupServiceResponseModel.logoURL,
        marketCapitalization: tickerLookupServiceResponseModel.marketCapitalization,
        name: tickerLookupServiceResponseModel.name,
        phoneNumber: tickerLookupServiceResponseModel.phoneNumber,
        sharesOutstanding: tickerLookupServiceResponseModel.sharesOutstanding,
        ticker: tickerLookupServiceResponseModel.ticker,
        webURL: tickerLookupServiceResponseModel.webURL);
  }
}
