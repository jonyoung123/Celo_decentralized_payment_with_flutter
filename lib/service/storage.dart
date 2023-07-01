import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:identity_preserving_dapp/model/connect_wallet.dart';

class WalletSecuredStorage {
  final storage = const FlutterSecureStorage();

  final String _walletKey = "userData";

  Future setwallet(ConnectWalletModel wallet) async {
    await storage.write(key: _walletKey, value: jsonEncode(wallet));
  }

  Future<ConnectWalletModel?> getWallet() async {
    var wallet = await storage.read(key: _walletKey);
    return wallet != null
        ? ConnectWalletModel.fromJson(jsonDecode(wallet))
        : null;
  }
}
