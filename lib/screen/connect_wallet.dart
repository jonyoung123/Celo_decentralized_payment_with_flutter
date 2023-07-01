import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:identity_preserving_dapp/model/connect_wallet.dart';
import 'package:identity_preserving_dapp/screen/widgets/celo_button.dart';
import 'package:identity_preserving_dapp/screen/widgets/celo_pop.dart';
import 'package:identity_preserving_dapp/screen/widgets/snack_bar.dart';
import 'package:identity_preserving_dapp/service/celo_helper.dart';

class CheckUserAccounts extends ConsumerStatefulWidget {
  const CheckUserAccounts({super.key});

  @override
  ConsumerState<CheckUserAccounts> createState() => _CheckUserAccountsState();
}

class _CheckUserAccountsState extends ConsumerState<CheckUserAccounts> {
  TextEditingController addressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        centerTitle: true,
        title: const Text(
          'Connect Wallet',
          maxLines: 1,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w800, color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.04, right: size.width * 0.04, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  Image.asset('assets/images/logo.png', height: 80, width: 120),
                  const SizedBox(width: 10),
                  const Text(
                    'Payment',
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Enter your details to connect your wallet to your products on the dApp.',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      text: 'Business Name',
                      controller: nameController,
                      hint: 'enter your Business name',
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      text: 'Wallet address',
                      controller: addressController,
                      hint: 'enter wallet address for the business',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              CustomButtonWidget(
                text: ref.watch(walletProvider).connectStatus == Status.loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Connect Wallet',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                onPressed: () async {
                  if (nameController.text.trim().isEmpty ||
                      addressController.text.trim().isEmpty) {
                    CustomSnackbar.responseSnackbar(context, Colors.redAccent,
                        'Fill the required fields..');
                    return;
                  }
                  ConnectWalletModel wallet = ConnectWalletModel(
                      businessName: nameController.text.trim(),
                      address: addressController.text.trim());
                  await ref
                      .read(walletProvider)
                      .connectWalletMethod(wallet, context);
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
