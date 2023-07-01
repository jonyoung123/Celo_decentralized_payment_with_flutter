import 'package:flutter/material.dart';
import 'package:identity_preserving_dapp/model/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key, required this.product, required this.onPressed});
  final ProductModel product;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 120,
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.black54),
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black12,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 90,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.network(product.productUrl!).image,
                )),
          ),
          const SizedBox(
              height: 5, child: Divider(color: Colors.black54, height: 5)),
          Text(
            product.productName!,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text('Price : ${product.productPrice} cUSD',
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black45),
            onPressed: onPressed,
            child: const Text('Pay Now'),
          ),
        ],
      ),
    );
  }
}
