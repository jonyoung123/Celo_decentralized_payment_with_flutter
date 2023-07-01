import 'package:flutter/material.dart';
import 'package:identity_preserving_dapp/screen/connect_wallet.dart';
import 'package:identity_preserving_dapp/screen/product_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey actionKey = GlobalKey();
  int selectedIndex = 0;
  List<Widget> screens = <Widget>[
    const SaveUserIdentity(),
    const CheckUserAccounts(),
  ];

  void _onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;
    // final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Products',
            icon: Icon(Icons.shop_two_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Connect Wallet',
            icon: Icon(Icons.account_balance_wallet),
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        selectedLabelStyle:
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        unselectedLabelStyle:
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        elevation: 20,
        showUnselectedLabels: true,
        onTap: _onTapped,
      ),
    );
  }

  Rect getWidgetBounds(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    return offset & renderBox.size;
  }
}
