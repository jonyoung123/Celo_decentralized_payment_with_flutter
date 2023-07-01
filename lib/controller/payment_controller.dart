import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:identity_preserving_dapp/model/product_model.dart';
import 'package:identity_preserving_dapp/screen/widgets/snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

final paymentProvider = ChangeNotifierProvider((ref) => PaymentController());

class PaymentController extends ChangeNotifier {
  List<ProductModel> fashionProducts = [
    ProductModel(
        productName: "Pants",
        productUrl:
            "https://www.reputation-studios.com/cdn/shop/products/flaretapestrypantspatchwork_800x.png?v=1681448328",
        productPrice: "25"),
    ProductModel(
        productName: "Hoodie",
        productPrice: "30",
        productUrl:
            "https://simambo.com/cdn/shop/products/DynamicImageHandler_0623f25e-172d-49c6-80cf-638a480290dd_1024x1024@2x.jpg?v=1660411961"),
    ProductModel(
        productName: "Shirt",
        productPrice: "20",
        productUrl:
            "https://www-konga-com-res.cloudinary.com/w_800,f_auto,fl_lossy,dpr_2.0,q_auto/media/catalog/product/I/F/180222_1627566273.jpg"),
    ProductModel(
        productName: "Gown",
        productPrice: "18",
        productUrl:
            "https://www-konga-com-res.cloudinary.com/w_auto,f_auto,fl_lossy,dpr_auto,q_auto/media/catalog/product/A/Q/138017_1615373591.jpg")
  ];
  List<ProductModel> accessoryProducts = [
    ProductModel(
        productName: "Phone case",
        productPrice: "10",
        productUrl:
            "https://www-konga-com-res.cloudinary.com/w_700,f_auto,fl_lossy,dpr_2.0,q_auto/media/catalog/product/W/A/156279_1625140142.jpg"),
    ProductModel(
        productName: "Phone stand",
        productPrice: "18",
        productUrl:
            "https://amateurphotographer.com/wp-content/uploads/sites/7/2023/01/Best-smartphone-accessories.jpg"),
    ProductModel(
        productName: "Phone Charger",
        productPrice: "15",
        productUrl:
            "https://pictures-nigeria.jijistatic.com/108271285_ODAwLTgwMC1iM2RjMjFjM2U4.webp"),
    ProductModel(
        productName: "Flash Drive",
        productPrice: "14",
        productUrl:
            "https://marketsng.fra1.digitaloceanspaces.com/images/LFVntKDfzSfXzV0bORgrgcWMQAJY6cOy0oFcSPef.jpeg")
  ];
  List<ProductModel> electronicsProducts = [
    ProductModel(
        productName: "Apple Tv",
        productPrice: "1200",
        productUrl:
            "https://www.apple.com/newsroom/images/product/tv/standard/Apple_unveils-the-next-gen-of-AppleTV4K_042021_big.jpg.large_2x.jpg"),
    ProductModel(
        productName: "Headphones",
        productPrice: "600",
        productUrl:
            "https://images-na.ssl-images-amazon.com/images/G/01/US-hq/2018/img/Consumer_Electronics/XCM_Manual_1122076_StorefrontMigration_750x750_Consumer_Electronics_1122076_us_consumer_electronics_storefrontmigration_750x750_6_jpg"),
    ProductModel(
        productName: "iPhone 8 plus",
        productPrice: "200",
        productUrl:
            "https://i.ebayimg.com/thumbs/images/g/92oAAOSwgsxhjFs2/s-l225.webp"),
    ProductModel(
        productName: "Monitor",
        productPrice: "600",
        productUrl:
            "https://i.ebayimg.com/images/g/YVUAAOSwFeNklcRA/s-l1600.jpg")
  ];

  Future launchURL(String url, context) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      CustomSnackbar.responseSnackbar(
          context, Colors.redAccent, 'Could not launch $url');
    }
  }
}
