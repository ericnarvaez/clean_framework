import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_example/ticker_lookup/api/ticker_lookup_service.dart';
import '../../example_locator.dart';
import '../model/ticker_lookup_view_model.dart';
import 'ticker_lookup_usecase.dart';

class TickerLookupBloc extends Bloc {
  TickerLookupUseCase _tickerLookupUseCase;

  final tickerLookupViewModelPipe = Pipe<TickerLookupViewModel>();
  final submitPipe = EventPipe();
  String tickerSymbol;

  @override
  void dispose() {
    tickerLookupViewModelPipe.dispose();
    submitPipe.dispose();
  }

  TickerLookupBloc({TickerLookupService tickerLookupService}) {
    _tickerLookupUseCase = TickerLookupUseCase((viewModel) => tickerLookupViewModelPipe.send(viewModel));
    tickerLookupViewModelPipe.onListen(() => _tickerLookupUseCase.create());
    submitPipe.listen(submitHandler);
    logger().debug('TickerLookup ---> TickerLookupBloc Invoked: Submit Handler Setup');
  }

  void submitHandler() {
    _tickerLookupUseCase.submit(tickerSymbol);
  }
}
