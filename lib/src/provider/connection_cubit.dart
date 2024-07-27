import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityCubit extends Cubit<List<ConnectivityResult>> {
  final Connectivity _connectivity = Connectivity();

  ConnectivityCubit() : super([ConnectivityResult.none]) {
    _init();
  }

  Future<void> _init() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    emit(connectivityResult);

    _connectivity.onConnectivityChanged.listen((result) {
      _checkConnectivity(result);
    });
  }

  bool get isConnected => state.any((element) =>
      element == ConnectivityResult.wifi ||
      element == ConnectivityResult.mobile ||
      element == ConnectivityResult.ethernet);

  bool showInternetDialog = false;

  void _checkConnectivity(List<ConnectivityResult> result) {
    if (result.any((element) => element == ConnectivityResult.none)) {
      showInternetDialog = true;
      // Show snackbar or any other UI indication
      // showTopSnackBar(
      //   Overlay.of(context),
      //   const CustomSnackBar.error(
      //     message: 'No Internet Connection',
      //   ),
      //   persistent: true,
      //   onAnimationControllerInit: (controller) {
      //     localAnimationController = controller;
      //   },
      // );
      emit([ConnectivityResult.none]);
    } else {
      if (showInternetDialog) {
        showInternetDialog = false;
        // Reverse animation if needed
        // localAnimationController.reverse();
      }
      emit(result);
    }
  }
}
