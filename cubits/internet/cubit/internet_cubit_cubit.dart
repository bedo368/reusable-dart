import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_useable_widget_and_classes/cubits/internet/cubit/internet_cubit_state.dart';



// Define cubit
class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  InternetCubit() : super(InternetLoading()) {
    _init();
  }

  Future<void> _init() async {
    // Initial internet state check
    final connectivityResult = await _connectivity.checkConnectivity();
    _mapConnectivityToState(connectivityResult);

    // Listen to connectivity changes
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      _mapConnectivityToState(event);
    });
  }

  void _mapConnectivityToState(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      emit(InternetDisconnected());
    } else {
      bool isConnected = await _isConnectedToInternet();
      if (isConnected) {
        emit(InternetConnected());
      } else {
        emit(InternetDisconnected());
      }
    }
  }

  Future<bool> _isConnectedToInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
