import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../bloc/ticker_lookup_bloc.dart';
import 'ticker_lookup_presenter.dart';

class TickerLookupFeatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TickerLookupBloc(),
      child: TickerLookupPresenter(),
    );
  }
}
