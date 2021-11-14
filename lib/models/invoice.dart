import 'dart:convert';

InvoiceModal InvoiceModalJson(String str) => InvoiceModal.fromJson(json.decode(str));

String InvoiceModalToJson(InvoiceModal data) => jsonEncode(data.toJson());

class InvoiceModal {
  String id;
  String generatedDate;
  String generatedTime;
  String generatedUser;

  InvoiceModal(
      {required this.id,
      required this.generatedDate,
      required this.generatedTime,
      required this.generatedUser});

  factory InvoiceModal.fromJson(Map<String, dynamic> json) => InvoiceModal(
      id: json["id"],
      generatedDate: json["generatedDate"],
      generatedTime: json["generatedTime"],
      generatedUser: json["generatedUser"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "generatedDate": generatedDate,
        "generatedTime": generatedTime,
        "generatedUser": generatedUser,
      };

  String get Invoice_id => id;
  String get Invoice_generatedDate => generatedDate;
  String get Invoice_generatedTime => generatedTime;
  String get Invoice_generatedUser => generatedUser;
}
