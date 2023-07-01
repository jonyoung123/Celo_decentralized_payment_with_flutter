class ConnectWalletModel {
  String? businessName;
  String? address;

  ConnectWalletModel({
    this.businessName,
    this.address,
  });

  ConnectWalletModel.fromJson(Map<String, dynamic> json) {
    businessName = json['businessName'] as String?;
    address = json['address'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['businessName'] = businessName;
    json['address'] = address;
    return json;
  }
}
