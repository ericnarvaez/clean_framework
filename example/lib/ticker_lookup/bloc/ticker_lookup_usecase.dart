import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import '../../example_locator.dart';
import '../model/ticker_lookup_entity.dart';
import '../model/ticker_lookup_view_model.dart';
import 'ticker_lookup_service_adapter.dart';

class TickerLookupUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;

  TickerLookupUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<TickerLookupEntity>();
    if (_scope == null) {
      _scope = ExampleLocator()
          .repository
          .create<TickerLookupEntity>(TickerLookupEntity(), _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    final entity = ExampleLocator().repository.get<TickerLookupEntity>(_scope);
    _viewModelCallBack(buildViewModelForLocalUpdate(entity));
  }

  void submit(String tickerValue) async {
    final entity = ExampleLocator().repository.get<TickerLookupEntity>(_scope);
    if (tickerValue == '' ||tickerValue == null) {
      logger().debug('TickerLookup ---> tickerValue is empty');
      _viewModelCallBack(buildViewModelForLocalUpdateWithError(entity));
    } else {
      logger().debug('TickerLookup ---> tickerValue is not empty: ' + tickerValue);
      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope, TickerLookupServiceAdapter(tickerValue));
    }
  }

  void _notifySubscribers(entity) {
    logger().debug('TickerLookup ---> buildViewModelForServiceUpdate :' + entity.toString());
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  TickerLookupViewModel buildViewModelForServiceUpdate(TickerLookupEntity entity) {
    logger().debug('TickerLookup ---> buildViewModelForServiceUpdate : ' + entity.props.toString());
    if (entity.hasErrors()) {
      logger().debug('TickerLookup ---> buildViewModelForServiceUpdate Errors:' + entity.errors.toString());
      return null;
    } else {
      logger().debug('TickerLookup ---> buildViewModelForServiceUpdate No Errors');
      return TickerLookupViewModel(
          country: entity.country,
          currency: entity.currency,
          exchange: entity.exchange,
          industry: entity.industry,
          ipoDate: entity.ipoDate,
          logoURL: entity.logoURL,
          marketCapitalization: entity.marketCapitalization,
          name: entity.name,
          phoneNumber: entity.phoneNumber,
          sharesOutstanding: entity.sharesOutstanding,
          ticker: entity.ticker,
          webURL: entity.webURL,
          serviceStatus: ServiceStatus.successful);
    }
  }

  TickerLookupViewModel buildViewModelForLocalUpdate(TickerLookupEntity entity) {
    return TickerLookupViewModel(
        country: entity.country,
        currency: entity.currency,
        exchange: entity.exchange,
        industry: entity.industry,
        ipoDate: entity.ipoDate,
        logoURL: entity.logoURL,
        marketCapitalization: entity.marketCapitalization,
        name: entity.name,
        phoneNumber: entity.phoneNumber,
        sharesOutstanding: entity.sharesOutstanding,
        ticker: entity.ticker,
        webURL: entity.webURL);
  }

  TickerLookupViewModel buildViewModelForLocalUpdateWithError(TickerLookupEntity entity) {
    return TickerLookupViewModel(
        country: entity.country,
        currency: entity.currency,
        exchange: entity.exchange,
        industry: entity.industry,
        ipoDate: entity.ipoDate,
        logoURL: entity.logoURL,
        marketCapitalization: entity.marketCapitalization,
        name: entity.name,
        phoneNumber: entity.phoneNumber,
        sharesOutstanding: entity.sharesOutstanding,
        ticker: entity.ticker,
        webURL: entity.webURL,
        dataStatus: DataStatus.invalid);
  }
}
