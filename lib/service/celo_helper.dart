import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:identity_preserving_dapp/model/connect_wallet.dart';
import 'package:identity_preserving_dapp/screen/widgets/dialogs.dart';
import 'package:identity_preserving_dapp/screen/widgets/snack_bar.dart';
import 'package:identity_preserving_dapp/service/storage.dart';

final walletProvider =
    ChangeNotifierProvider((ref) => ConnectWalletController());

enum Status { init, loading, done }

class ConnectWalletController extends ChangeNotifier {
  Status connectStatus = Status.init;

  Future connectWalletMethod(ConnectWalletModel wallet, context) async {
    try {
      connectStatus =
          connectStatus != Status.loading ? Status.loading : Status.done;
      if (connectStatus == Status.done) return;
      notifyListeners();
      await WalletSecuredStorage().setwallet(wallet);
      connectStatus = Status.done;
      notifyListeners();
      alertDialogs(
          context,
          "Connect Wallet",
          "Wallet successfully connected. Users will pay to your address",
          () => Navigator.pop(context));
    } catch (e) {
      connectStatus = Status.done;
      notifyListeners();
      debugPrint(e.toString());
      CustomSnackbar.responseSnackbar(
          context, Colors.redAccent, "Unable to connect wallet");
    }
  }
}
