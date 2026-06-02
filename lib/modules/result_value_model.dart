import 'package:flutter/material.dart';

class ResultValueProvider extends ChangeNotifier{
  String _resultView;
  String _detailView;

  ResultValueProvider({required String resultView, required String detailView})
    : _detailView = detailView,
      _resultView = resultView;

  set setResultView(String resultView){
    notifyListeners();
    _resultView = resultView;
  }

  String get getResultView{
    return _resultView;
  }

  set setDetailView(String detailView){
    notifyListeners();
    _detailView = detailView;
  }

  String get getDetailView{
    return _detailView;
  }
}