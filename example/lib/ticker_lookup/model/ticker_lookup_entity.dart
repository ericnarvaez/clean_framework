import 'package:clean_framework/clean_framework.dart';

class TickerLookupEntity extends Entity {
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

  TickerLookupEntity({
    List<EntityError> errors = const [],
      String country,
      String currency,
      String exchange,
      String industry,
      String ipoDate,
      String logoURL,
      double marketCapitalization,
      String name,
      String phoneNumber,
      double sharesOutstanding,
      String ticker,
      String webURL})
    : this.country = country ?? '',
      this.currency = currency ?? '',
      this.exchange = exchange ?? '',
      this.industry = industry ?? '',
      this.ipoDate = ipoDate ?? '',
      this.logoURL = logoURL ?? '',
      this.marketCapitalization = marketCapitalization ?? 0.0,
      this.name = name ?? '',
      this.phoneNumber = phoneNumber ?? '',
      this.sharesOutstanding = sharesOutstanding ?? 0.0,
      this.ticker = ticker ?? '',
      this.webURL = webURL ?? '',
      super(errors: errors);

  @override
  List<Object> get props => [
      errors,
      country,
      currency,
      exchange,
      industry,
      ipoDate,
      logoURL,
      marketCapitalization,
      name,
      phoneNumber,
      sharesOutstanding,
      ticker,
      webURL];

  @override
  merge({errors,
  String country,
  String currency,
  String exchange,
  String industry,
  String ipoDate,
  String logoURL,
  double marketCapitalization,
  String name,
  String phoneNumber,
  double sharesOutstanding,
  String ticker,
  String webURL}) {
    return TickerLookupEntity(
      errors: errors ?? this.errors,
      country: country ?? this.country,
      currency: currency ?? this.currency,
      exchange: exchange ?? this.exchange,
      industry: industry ?? this.industry,
      ipoDate: ipoDate ?? this.ipoDate,
      logoURL: logoURL ?? this.logoURL,
      marketCapitalization: marketCapitalization ?? this.marketCapitalization,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      sharesOutstanding: sharesOutstanding ?? this.sharesOutstanding,
      ticker: ticker ?? this.ticker,
      webURL: webURL ?? this.webURL);
  }
}
