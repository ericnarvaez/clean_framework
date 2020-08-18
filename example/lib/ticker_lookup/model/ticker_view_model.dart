import 'package:clean_framework/clean_framework.dart';

enum ServiceStatus { failed, successful, unknown }
enum DataStatus { valid, invalid, unknown }

class TickerViewModel extends ViewModel {
  final double close;
  final double high;
  final double low;
  final double openPrice;
  final double previousClosePrice;
  final double tradedShares;
  final serviceStatus;
  final dataStatus;

  TickerViewModel({
      this.close,
      this.high,
      this.low,
      this.openPrice,
      this.previousClosePrice,
      this.tradedShares,
      this.serviceStatus = ServiceStatus.unknown,
      this.dataStatus = DataStatus.unknown})
      : assert(
          close != null &&
          high != null &&
          low != null &&
          openPrice != null &&
          previousClosePrice != null &&
          tradedShares != null);
}
