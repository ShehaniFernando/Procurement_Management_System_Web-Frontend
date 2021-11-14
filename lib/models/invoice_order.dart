import 'dart:convert';

InvoiceOrderModal invoiceOrderModalJson(String str) =>
    InvoiceOrderModal.fromJson(json.decode(str));

String invoiceOrderModalToJson(InvoiceOrderModal data) =>
    jsonEncode(data.toJson());

class InvoiceOrderModal {
  String orderId;
  String item;
  double price;
  double quantity;
  String supplier;
  String status;
  double amount;
  String comment;
  String site;
  String orderDate;
  String deliveryDate;

  String invoiceId;
  String generatedDate;
  String generatedUser;

  String siteAddress;
  String supplierAddress;

  InvoiceOrderModal(
      {required this.orderId,
      required this.item,
      required this.price,
      required this.quantity,
      required this.supplier,
      required this.status,
      required this.amount,
      required this.comment,
      required this.site,
      required this.orderDate,
      required this.deliveryDate,
      required this.invoiceId,
      required this.generatedDate,
      required this.generatedUser,
      required this.siteAddress,
      required this.supplierAddress});

  factory InvoiceOrderModal.fromJson(Map<String, dynamic> json) =>
      InvoiceOrderModal(
          orderId: json["orderId"],
          item: json["item"],
          price: json["price"],
          quantity: json["quantity"],
          supplier: json["supplier"],
          status: json["status"],
          amount: json["amount"],
          comment: json["comment"],
          site: json["site"],
          orderDate: json["orderDate"],
          deliveryDate: json["deliveryDate"],

          invoiceId: json["invoiceId"],
          generatedDate: json["generatedDate"],
          generatedUser: json["generatedUser"],
          
          siteAddress: json["siteAddress"],
          supplierAddress: json["supplierAddress"]);

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "item": item,
        "price": price,
        "quantity": quantity,
        "supplier": supplier,
        "status": status,
        "amount": amount,
        "comment": comment,
        "site": site,
        "orderDate": orderDate,
        "deliveryDate": deliveryDate,

        "invoiceId": invoiceId,
        "generatedDate": generatedDate,
        "generatedUser": generatedUser,

        "siteAddress": siteAddress,
        "supplierAddress": supplierAddress
      };

  String get order_id => orderId;
  String get order_item => item;
  double get order_price => price;
  double get order_quantity => quantity;
  String get order_supplier => supplier;
  String get order_status => status;
  double get order_amount => amount;
  String get order_comment => comment;
  String get order_site => site;
  String get order_orderDate => orderDate;
  String get order_deliveryDate => deliveryDate;

  String get invoive_id => invoiceId;
  String get invoive_generatedDate => generatedDate;
  String get invoive_generatedUser => generatedUser;

  String get order_siteAddress => siteAddress;
  String get order_supplierAddress => supplierAddress;
}
