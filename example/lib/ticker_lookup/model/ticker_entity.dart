import 'package:clean_framework/clean_framework.dart';

class TickerEntity extends Entity {
  final double close;
  final double high;
  final double low;
  final double openPrice;
  final double previousClosePrice;
  final double tradedShares;

  TickerEntity({
    List<EntityError> errors = const [],
        double close,
        double high,
        double low,
        double openPrice,
        double previousClosePrice,
        double tradedShares
      })
      : this.close = close ?? '',
        this.high = high ?? '',
        this.low = low ?? '',
        this.openPrice = openPrice ?? '',
        this.previousClosePrice = previousClosePrice ?? '',
        this.tradedShares = tradedShares ?? '',
        super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        close,
        high,
        low,
        openPrice,
        previousClosePrice,
        tradedShares];

  @override
  merge({errors, String fromAccount, String toAccount, double amount}) {
    return TickerEntity(
        errors: errors ?? this.errors,
        close: close ?? this.close,
        high: high ?? this.high,
        low: low ?? this.low,
        openPrice: openPrice ?? this.openPrice,
        previousClosePrice: previousClosePrice ?? this.previousClosePrice,
        tradedShares: tradedShares ?? this.tradedShares);
  }
}
