import 'package:clean_framework/clean_framework.dart';

enum ServiceStatus { failed, successful, unknown }
enum DataStatus { valid, invalid, unknown }

class TickerLookupViewModel extends ViewModel {
  final String country;
  final String currency;
  final String exchange;
  final String industry;
  final String ipoDate;
  final String logoURL;
  final double marketCapitalization;
  final String name;
  final String phoneNumber;
  final double sharesOutstanding;
  final String ticker;
  final String webURL;
  final serviceStatus;
  final dataStatus;

  TickerLookupViewModel({
      this.country,
      this.currency,
      this.exchange,
      this.industry,
      this.ipoDate,
      this.logoURL,
      this.marketCapitalization,
      this.name,
      this.phoneNumber,
      this.sharesOutstanding,
      this.ticker,
      this.webURL,
      this.serviceStatus = ServiceStatus.unknown,
      this.dataStatus = DataStatus.unknown})
      : assert(
          country != null &&
          currency != null &&
          exchange != null &&
          industry != null &&
          ipoDate != null &&
          logoURL != null &&
          marketCapitalization != null &&
          name != null &&
          phoneNumber != null &&
          sharesOutstanding != null &&
          ticker != null &&
          webURL != null &&
          serviceStatus != null &&
          dataStatus != null);
}
