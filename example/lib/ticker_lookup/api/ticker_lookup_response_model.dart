import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class TickerLookupServiceResponseModel extends Equatable implements JsonResponseModel {
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

  TickerLookupServiceResponseModel.fromJson(Map<String, dynamic> json)
        :
        country = json['country'] ?? '',
        currency = json['currency'] ?? '',
        exchange = json['exchange'] ?? '',
        industry = json['finnhubIndustry'] ?? '',
        ipoDate = json['ipo'] ?? '',
        logoURL = json['logo'] ?? '',
        marketCapitalization = json['marketCapitalization'] ?? 0.0,
        name = json['name'] ?? '',
        phoneNumber = json['phone'] ?? '',
        sharesOutstanding = json['shareOutstanding'] ?? 0.0,
        ticker = json['ticker'] ?? '',
        webURL = json['weburl'] ?? '';

  @override
  List<Object> get props => [
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
}
