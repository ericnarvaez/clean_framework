import 'dart:async';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_example/example_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../bloc/ticker_lookup_bloc.dart';
import '../model/ticker_lookup_view_model.dart';
import 'ticker_lookup_screen.dart';

class TickerLookupPresenter
    extends Presenter<TickerLookupBloc, TickerLookupViewModel, TickerLookupScreen> {
  @override
  Stream<TickerLookupViewModel> getViewModelStream(TickerLookupBloc bloc) {
    return bloc.tickerLookupViewModelPipe.receive;
  }

  @override
  TickerLookupScreen buildScreen(
      BuildContext context, TickerLookupBloc bloc, TickerLookupViewModel tickerLookupViewModel) {
    logger().debug('TickerLookup ---> viewModel: ' + tickerLookupViewModel.toString());

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (tickerLookupViewModel.serviceStatus == ServiceStatus.successful) {
        _navigateToDetailScreen(context, tickerLookupViewModel);
      } else if (tickerLookupViewModel.serviceStatus == ServiceStatus.failed) {
        _showErrorDialog(context);
      } else if (tickerLookupViewModel.dataStatus == DataStatus.invalid) {
        _showInvalidDataDialog(context);
      }
    });
    return TickerLookupScreen(
      viewModel: tickerLookupViewModel,
      onChangeTickerSymbol: (value){
        logger().debug('TickerLookup ---> Changed : ' + value);
        _onChangeTickerSymbol(value, bloc);
      },
      onTapSubmit: () {
        logger().debug('TickerLookup ---> Get Quote Pressed');
        _onTapSubmit(bloc);
      },
    );
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _onTapSubmit(TickerLookupBloc bloc) {
    logger().debug('TickerLookup ---> _onTapSubmit Invoked');
    bloc.submitPipe.launch();
  }

  void _onChangeTickerSymbol(String text, TickerLookupBloc bloc) {
    bloc.tickerSymbol = text;
  }

  //For the sake of simplicity I just returned the entity data to the
  //alertDialog object, instead of building out a full fledged
  //single dedicated page UI.
  void _navigateToDetailScreen(BuildContext context,
      TickerLookupViewModel tickerLookupViewModel) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Ticker Listing Data for : ' + tickerLookupViewModel.name),
          content: Text(
              'Country: ' + tickerLookupViewModel.country + '\n' +
              'Currency: ' + tickerLookupViewModel.currency + '\n' +
              'Exchange: ' + tickerLookupViewModel.exchange + '\n' +
              'Industry: ' + tickerLookupViewModel.industry + '\n' +
              'IPO Date: ' + tickerLookupViewModel.ipoDate + '\n' +
              'Logo URL: ' + tickerLookupViewModel.logoURL + '\n' +
              'Market Cap.: ' + tickerLookupViewModel.marketCapitalization.toString() + '\n' +
              'Name: ' + tickerLookupViewModel.name + '\n' +
              'Phone Number: ' + tickerLookupViewModel.phoneNumber + '\n' +
              'Shares Outs.: ' + tickerLookupViewModel.sharesOutstanding.toString() + '\n' +
              'Ticker : ' + tickerLookupViewModel.ticker + '\n' +
              'Web URL: ' + tickerLookupViewModel.webURL + '\n'),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) {
                    return route.isFirst;
                  });
                },
                child: Text('OK'))
          ],
        ));
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Error'),
          content: Text('Submit Failed'),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'))
          ],
        ));
  }

  void _showInvalidDataDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Invalid'),
          content: Text('Data entered is incorrect.'),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'))
          ],
        ));
  }
}