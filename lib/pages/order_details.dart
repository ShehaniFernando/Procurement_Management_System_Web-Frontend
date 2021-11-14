import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:procurement_management_system_web_frontend/constants.dart' as Constants;
import 'package:procurement_management_system_web_frontend/models/order.dart';
import 'package:procurement_management_system_web_frontend/pages/orders.dart';
import 'package:procurement_management_system_web_frontend/widgets/procurement_drawer.dart';

class OrderDetails extends StatefulWidget {
  final OrderModal orderModal;

  const OrderDetails({
    Key? key,
    required this.orderModal
  }) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

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
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(100, 30, 100, 30),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 40),
                Text(
                  'ORDER DETAILS',
                  style: TextStyle(
                    fontWeight: FontWeight.w800
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 30, 20, 0),
                        height: 200,
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Site Details:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              widget.orderModal.site,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 3),
                            Text(
                              widget.orderModal.siteAddress,
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      ),
                      Container(
                        // color: Colors.green,
                        margin: EdgeInsets.fromLTRB(20, 30, 265, 0),
                        height: 200,
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Supplier Details:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              widget.orderModal.supplier,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 3),
                            Text(
                              widget.orderModal.supplierAddress,
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(150, 30, 10, 0),
                        height: 200,
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order Date:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              widget.orderModal.orderDate
                                  .split('T')[0],
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Delivery Date:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              widget.orderModal.deliveryDate
                                  .split('T')[0],
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  margin: EdgeInsets.only(left: 50, right: 50),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment.top,
                        defaultColumnWidth: FixedColumnWidth(244),
                        border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1,
                        ),
                        children: [
                          TableRow(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Order Id',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      height: 3
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Item',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      height: 3
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Unit Price',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      height: 3
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Quantity',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      height: 3
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      height: 3
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          ),
                          TableRow(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    widget.orderModal.id,
                                    style: TextStyle(
                                      height: 3
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    widget.orderModal.item,
                                    style: TextStyle(
                                      height: 3
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    widget.orderModal.price.toString() + '.00',
                                    style: TextStyle(
                                      height: 3
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    widget.orderModal.quantity.toString(),
                                    style: TextStyle(
                                      height: 3
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    widget.orderModal.amount.toString() + '.00',
                                    style: TextStyle(
                                      height: 3
                                    ),
                                  )
                                ],
                              ),
                            ]
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  margin: EdgeInsets.only(left: 50, right: 50),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment.top,
                        defaultColumnWidth: FixedColumnWidth(305),
                        children: [
                          TableRow(
                            children: [
                              Column(
                                children: [
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
                                            {updateOrderStatusApprove(widget.orderModal.id.toString(), value.toString(), context)}
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
                                            EdgeInsets.fromLTRB(50, 25, 50, 25))),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
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
                                            {updateOrderStatusHold(widget.orderModal.id.toString(), value.toString(), context)}
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
                                            EdgeInsets.fromLTRB(50, 25, 50, 25))),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
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
                                            {updateOrderStatusRefer(widget.orderModal.id.toString(), value.toString(), context)}
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
                                            EdgeInsets.fromLTRB(50, 25, 50, 25))),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
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
                                            {updateOrderStatusDecline(widget.orderModal.id.toString(), value.toString(), context)}
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
                                            EdgeInsets.fromLTRB(50, 25, 50, 25))),
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        )
      );
  }
}
