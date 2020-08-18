import 'package:clean_framework/clean_framework.dart';

class PeersLookupEntity extends Entity {
  final String industryPeers;

  PeersLookupEntity({List<EntityError> errors = const [], String industryPeers})
      : this.industryPeers = industryPeers ?? '',
        super(errors: errors);

  @override
  List<Object> get props => [errors, industryPeers];

  @override
  merge({errors, List<String> industryPeers}) {
    return PeersLookupEntity(
        errors: errors ?? this.errors,
        industryPeers: industryPeers ?? this.industryPeers);
  }
}
