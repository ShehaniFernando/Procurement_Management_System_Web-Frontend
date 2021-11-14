import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:procurement_management_system_web_frontend/constants.dart' as Constants;
import 'package:procurement_management_system_web_frontend/models/order.dart';
import 'package:procurement_management_system_web_frontend/pages/order_details.dart';
import 'package:procurement_management_system_web_frontend/widgets/procurement_drawer.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<OrderModal>? orders;

  Future<void> getOrders() async {
    var data = await http.get(
        Uri.parse(Constants.BASE_URL + Constants.URL_PENDING_ORDERS),
        headers: {"Accept": "application/json"});

    var jsonData = await convert.json.decode(data.body);

    orders = [];

    for (var e in jsonData) {
      OrderModal order = new OrderModal(
          id: e["id"],
          item: e["item"]["material"]["name"],
          price: e["item"]["material"]["price"],
          quantity: e["item"]["quantity"],
          supplier: e["supplier"]["name"],
          status: e["status"],
          amount: e["amount"],
          comment: e["comment"],
          site: e["site"]["name"],
          orderDate: e["purchaseTimestamp"],
          deliveryDate: e["deliveryTimestamp"],
          
          siteAddress: e["site"]["address"],
          supplierAddress: e["supplier"]["address"],);

      orders!.add(order);
    }
  }

  updateOrderStatusApprove(String id, String val, BuildContext context) async {
    var url = Constants.BASE_URL + Constants.URL_APPROVED_ORDERS + id.toString().trim();

    var response = await http.put(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Orders()));
      Fluttertoast.showToast(
          msg: Constants.ORDER_STATUS_UPDATED_SUCCESSFULLY,
          backgroundColor: Colors.grey,
          fontSize: 18);
    } else {
      Fluttertoast.showToast(
          msg: Constants.ERROR_UPDATE_ORDER,
          backgroundColor: Colors.grey,
          fontSize: 18);
    }
  }

  updateOrderStatusHold(String id, String val, BuildContext context) async {
    var url = Constants.BASE_URL + Constants.URL_HOLD_ORDERS + id.toString().trim();

    var response = await http.put(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Orders()));
      Fluttertoast.showToast(
          msg: Constants.ORDER_STATUS_UPDATED_SUCCESSFULLY,
          backgroundColor: Colors.grey,
          fontSize: 18);
    } else {
      Fluttertoast.showToast(
          msg: Constants.ERROR_UPDATE_ORDER,
          backgroundColor: Colors.grey,
          fontSize: 18);
    }
  }

  updateOrderStatusRefer(String id, String val, BuildContext context) async {
    var url = Constants.BASE_URL + Constants.URL_REFERRED_ORDERS + id.toString().trim();

    var response = await http.put(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Orders()));
      Fluttertoast.showToast(
          msg: Constants.ORDER_STATUS_UPDATED_SUCCESSFULLY,
          backgroundColor: Colors.grey,
          fontSize: 18);
    } else {
      Fluttertoast.showToast(
          msg: Constants.ERROR_UPDATE_ORDER,
          backgroundColor: Colors.grey,
          fontSize: 18);
    }
  }

  updateOrderStatusDecline(String id, String val, BuildContext context) async {
    var url = Constants.BASE_URL + Constants.URL_DECLINED_ORDERS + id.toString().trim();

    var response = await http.put(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Orders()));
      Fluttertoast.showToast(
          msg: Constants.ORDER_STATUS_UPDATED_SUCCESSFULLY,
          backgroundColor: Colors.grey,
          fontSize: 18);
    } else {
      Fluttertoast.showToast(
          msg: Constants.ERROR_UPDATE_ORDER,
          backgroundColor: Colors.grey,
          fontSize: 18);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ProcurementDrawer(),
        appBar: AppBar(
          // title: Text('Orders'),
        ),
        body: Container(
          child: Center(
            child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              Text(
                'ORDERS PENDING APPROVAL',
                style: TextStyle(
                  fontWeight: FontWeight.w800
                ),
              ),
              SizedBox(height: 40),
              FutureBuilder(
                  future: getOrders(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Center(child: Text('None'));
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      case ConnectionState.done:
                        return (orders == null) 
                        ? Center(
                          child: Text('NO PENDING ORDERS...')) 
                        : DataTable(
                          columns: <DataColumn>[
                            DataColumn(label: Text('SITE')),
                            DataColumn(label: Text('DATE REQUIRED')),
                            DataColumn(label: Text('ITEM')),
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('')),
                          ],
                          rows: orders!
                            .map((e) => DataRow(cells: [
                              DataCell(Text(e.site.toString())),
                              DataCell(Text(e.deliveryDate.toString().split('T')[0])),
                              DataCell(Text(e.item.toString())),
                              DataCell(
                                // Text('View Details...')
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OrderDetails(
                                                      orderModal:
                                                          e)));
                                    },
                                    child: Text('View Details'))
                                  ),
                              DataCell(
                                  ElevatedButton(
                                    onPressed: () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title: Text('Approve Order'),
                                              content: Text(
                                                  'Click "OK" to confirm approval of order'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () => Navigator.pop(
                                                        context, 'Cancel'),
                                                    child: Text('Cancel')),
                                                TextButton(
                                                    onPressed: () => Navigator.pop(
                                                        context, 'OK'),
                                                    child: Text('OK'))
                                              ],
                                            )).then((value) => {
                                          if (value == 'OK')
                                            {updateOrderStatusApprove(e.id.toString(), value.toString(), context)}
                                        }),
                                    child: Text(
                                      'APPROVE',
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
                                            EdgeInsets.fromLTRB(35, 18, 35, 18))),
                                  ),
                                  ),
                              DataCell(
                              ElevatedButton(
                                onPressed: () => showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Text('Hold Order'),
                                          content: Text(
                                              'Click "OK" to confirm holding order'),
                                          actions: [
                                            TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancel'),
                                                child: Text('Cancel')),
                                            TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: Text('OK'))
                                          ],
                                        )).then((value) => {
                                      if (value == 'OK')
                                        {updateOrderStatusHold(e.id.toString(), value.toString(), context)}
                                    }),
                                child: Text(
                                  'HOLD',
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
                                            Colors.yellow.shade700),
                                    padding: MaterialStateProperty.all<
                                            EdgeInsetsGeometry>(
                                        EdgeInsets.fromLTRB(35, 18, 35, 18))),
                              ),
                              ),
                              DataCell(
                              ElevatedButton(
                                onPressed: () => showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Text('Refer Order'),
                                          content: Text(
                                              'Click "OK" to confirm referring order'),
                                          actions: [
                                            TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancel'),
                                                child: Text('Cancel')),
                                            TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: Text('OK'))
                                          ],
                                        )).then((value) => {
                                      if (value == 'OK')
                                        {updateOrderStatusRefer(e.id.toString(), value.toString(), context)}
                                    }),
                                child: Text(
                                  'REFER TO MANAGER',
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
                                            Colors.orange.shade800),
                                    padding: MaterialStateProperty.all<
                                            EdgeInsetsGeometry>(
                                        EdgeInsets.fromLTRB(35, 18, 35, 18))),
                              ),
                              ),
                              DataCell(
                              ElevatedButton(
                                onPressed: () => showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Text('Reject Order'),
                                          content: Text(
                                              'Click "OK" to confirm reject order'),
                                          actions: [
                                            TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancel'),
                                                child: Text('Cancel')),
                                            TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: Text('OK'))
                                          ],
                                        )).then((value) => {
                                      if (value == 'OK')
                                        {updateOrderStatusDecline(e.id.toString(), value.toString(), context)}
                                    }),
                                child: Text(
                                  'REJECT',
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
                                            Colors.red.shade700),
                                    padding: MaterialStateProperty.all<
                                            EdgeInsetsGeometry>(
                                        EdgeInsets.fromLTRB(35, 18, 35, 18))),
                              ),
                              ),
                            ]))
                        .toList());
                    }
                  }),
            ],
          ),
          )
        )
      );
  }
}
