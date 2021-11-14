import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:procurement_management_system_web_frontend/constants.dart' as Constants;
import 'package:procurement_management_system_web_frontend/models/invoice_order.dart';
import 'package:procurement_management_system_web_frontend/pages/invoice_details.dart';
import 'package:procurement_management_system_web_frontend/widgets/procurement_drawer.dart';

class Invoices extends StatefulWidget {
  const Invoices({Key? key}) : super(key: key);

  @override
  _InvoicesState createState() => _InvoicesState();
}

class _InvoicesState extends State<Invoices> {
  List<InvoiceOrderModal>? invoices;

  Future<void> getInvoices() async {
    var data = await http.get(
        Uri.parse(Constants.BASE_URL + Constants.URL_INVOICES),
        headers: {"Accept": "application/json"});

    var jsonData = await convert.json.decode(data.body);

    invoices = [];

    for (var e in jsonData) {
      InvoiceOrderModal invoice = new InvoiceOrderModal(
        orderId: e["order"]["id"],
        item: e["order"]["item"]["material"]["name"],
        price: e["order"]["item"]["material"]["price"],
        quantity: e["order"]["item"]["quantity"],
        supplier: e["order"]["supplier"]["name"],
        status: e["order"]["status"],
        amount: e["order"]["amount"],
        comment: e["order"]["comment"],
        site: e["order"]["site"]["name"],
        orderDate: e["order"]["purchaseTimestamp"],
        deliveryDate: e["order"]["deliveryTimestamp"],

        invoiceId: e["id"],
        generatedDate: e["generatedTimestamp"],
        generatedUser: e["generatedUser"],

        siteAddress: e["order"]["supplier"]["address"],
        supplierAddress: e["order"]["site"]["address"],
      );

      invoices!.add(invoice);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ProcurementDrawer(),
        appBar: AppBar(
          // title: Text('Invoices'),
        ),
        body: Container(
            child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              Text(
                'VIEW INVOICES',
                style: TextStyle(
                  fontWeight: FontWeight.w800
                ),
              ),
              SizedBox(height: 40),
              FutureBuilder(
                  future: getInvoices(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Center(child: Text('None'));
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      case ConnectionState.done:
                        return (invoices == null)
                            ? Center(child: Text('NO INVOICES TO SHOW...'))
                            : DataTable(
                                columns: <DataColumn>[
                                    DataColumn(label: Text('SITE')),
                                    DataColumn(label: Text('DATE DELIVERED')),
                                    DataColumn(label: Text('ITEM')),
                                    DataColumn(label: Text('TOTAL AMOUNT')),
                                    DataColumn(label: Text('')),
                                  ],
                                rows: invoices!
                                    .map((e) => DataRow(cells: [
                                          DataCell(Text(e.site.toString())),
                                          DataCell(Text(e.deliveryDate
                                              .toString()
                                              .split('T')[0])),
                                          DataCell(Text(e.item.toString())),
                                          DataCell(Text(e.amount.toString())),
                                          DataCell(
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            InvoiceDetails(
                                                                invoiceOrderModal:
                                                                    e)));
                                              },
                                              child: Text(
                                                'VIEW INVOICE',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue.shade700),
                                        padding: MaterialStateProperty.all<
                                                EdgeInsetsGeometry>(
                                            EdgeInsets.fromLTRB(25, 15, 25, 15))),
                                            ),
                                          )
                                        ]))
                                    .toList());
                    }
                  }),
            ],
          ),
        )));
  }
}
