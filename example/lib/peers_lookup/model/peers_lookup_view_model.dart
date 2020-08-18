import 'package:clean_framework/clean_framework.dart';

enum ServiceStatus { failed, successful, unknown }
enum DataStatus { valid, invalid, unknown }

class PeersLookupViewModel extends ViewModel {
  final String industryPeers;
  final serviceStatus;
  final dataStatus;

  PeersLookupViewModel({
        this.industryPeers,
        this.serviceStatus = ServiceStatus.unknown,
        this.dataStatus = DataStatus.unknown})
      : assert(industryPeers != null);
}
