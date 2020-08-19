import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_example/ticker_lookup/model/ticker_lookup_view_model.dart';
import 'package:flutter/material.dart';

class TickerLookupScreen extends Screen {
  final TickerLookupViewModel viewModel;
  final Function onChangeTickerSymbol;
  final VoidCallback onTapSubmit;

  TickerLookupScreen({
    this.viewModel,
    this.onChangeTickerSymbol,
    this.onTapSubmit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Equity Ticker Look Up'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _TextFieldListTile(
                type: 'text',
                textTitle: 'Ticker Symbol',
                onChangeTextField: (value) {
                  onChangeTickerSymbol(value);
                },
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                child: RaisedButton(
                  child: Text('Get Quote'),
                  onPressed: () {
                    onTapSubmit();
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class _TextFieldListTile extends ListTile {
  final String textTitle;
  final String type;
  final String text;
  final Function onChangeTextField;

  _TextFieldListTile({
    this.textTitle,
    this.type,
    this.text,
    this.onChangeTextField,
  });

  Widget _buildContentField(BuildContext context) {
    final textController = TextEditingController();
    textController.text = text;
    textController.selection = TextSelection.fromPosition(
        TextPosition(offset: textController.text.length));
    return Container(
      child: TextField(
        controller: textController,
        keyboardType: TextInputType.text,
        enableInteractiveSelection: false,
        onChanged: (value) {
          onChangeTextField(value);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Text(
                    textTitle,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(child: _buildContentField(context)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
