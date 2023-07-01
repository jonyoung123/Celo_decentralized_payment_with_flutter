import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:identity_preserving_dapp/controller/payment_controller.dart';
import 'package:identity_preserving_dapp/model/connect_wallet.dart';
import 'package:identity_preserving_dapp/model/product_model.dart';
import 'package:identity_preserving_dapp/screen/widgets/product_card.dart';
import 'package:identity_preserving_dapp/screen/widgets/product_header.dart';
import 'package:identity_preserving_dapp/screen/widgets/snack_bar.dart';
import 'package:identity_preserving_dapp/service/storage.dart';

class SaveUserIdentity extends ConsumerWidget {
  const SaveUserIdentity({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final storage = WalletSecuredStorage();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        centerTitle: true,
        title: const Text(
          'Products',
          maxLines: 1,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w800, color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const ProductHeader(text: "Fashion Category"),
              const SizedBox(height: 15),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, int index) {
                    ProductModel product =
                        ref.read(paymentProvider).fashionProducts[index];
                    return ProductCard(
                      product: product,
                      onPressed: () async {
                        ConnectWalletModel? wallet = await storage.getWallet();
                        // if (context.mounted) return;
                        if (wallet == null && context.mounted) {
                          CustomSnackbar.responseSnackbar(
                              context,
                              Colors.redAccent,
                              "Payment address not assigned!");
                        } else if (wallet != null && context.mounted) {
                          String url =
                              'celo://wallet/pay?address=${wallet.address}&amount=${product.productPrice}&comment=${product.productName}';
                          ref.read(paymentProvider).launchURL(url, context);
                        }
                      },
                    );
                  },
                  itemCount: ref.read(paymentProvider).fashionProducts.length,
                ),
              ),
              const SizedBox(height: 20),
              const ProductHeader(text: "Accessories Category"),
              const SizedBox(height: 15),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, int index) {
                    ProductModel product =
                        ref.read(paymentProvider).accessoryProducts[index];
                    return ProductCard(
                      product: product,
                      onPressed: () async {
                        ConnectWalletModel? wallet = await storage.getWallet();
                        // if (context.mounted) return;
                        if (wallet == null && context.mounted) {
                          CustomSnackbar.responseSnackbar(
                              context,
                              Colors.redAccent,
                              "Payment address not assigned!");
                        } else if (wallet != null && context.mounted) {
                          String url =
                              'celo://wallet/pay?address=${wallet.address}&amount=${product.productPrice}&comment=${product.productName}';
                          ref.read(paymentProvider).launchURL(url, context);
                        }
                      },
                    );
                  },
                  itemCount: ref.read(paymentProvider).accessoryProducts.length,
                ),
              ),
              const SizedBox(height: 20),
              const ProductHeader(text: "Electronics Category"),
              const SizedBox(height: 15),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, int index) {
                    ProductModel product =
                        ref.read(paymentProvider).electronicsProducts[index];
                    return ProductCard(
                      product: product,
                      onPressed: () async {
                        ConnectWalletModel? wallet = await storage.getWallet();
                        // if (context.mounted) return;
                        if (wallet == null && context.mounted) {
                          CustomSnackbar.responseSnackbar(
                              context,
                              Colors.redAccent,
                              "Payment address not assigned!");
                        } else if (wallet != null && context.mounted) {
                          String url =
                              'celo://wallet/pay?address=${wallet.address}&amount=${product.productPrice}&comment=${product.productName}';
                          ref.read(paymentProvider).launchURL(url, context);
                        }
                      },
                    );
                  },
                  itemCount:
                      ref.read(paymentProvider).electronicsProducts.length,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
