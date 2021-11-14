import 'package:flutter/material.dart';
import 'package:procurement_management_system_web_frontend/models/invoice_order.dart';
import 'package:procurement_management_system_web_frontend/widgets/procurement_drawer.dart';

class InvoiceDetails extends StatefulWidget {
  final InvoiceOrderModal invoiceOrderModal;

  const InvoiceDetails({Key? key, required this.invoiceOrderModal})
      : super(key: key);

  @override
  _InvoiceDetailsState createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: ProcurementDrawer(),
        appBar: AppBar(
          // title: Text('Invoice Details'),
        ),
        body: Container(
            // decoration: BoxDecoration(color: Colors.white70, boxShadow: [
            //   BoxShadow(
            //       color: Colors.black, blurRadius: 4, offset: Offset(4, 4))
            // ]),
            margin: EdgeInsets.fromLTRB(100, 30, 100, 30),
            // color: Colors.blue,
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 40),
                  Text(
                    'INVOICE DETAILS',
                    style: TextStyle(
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    // color: Colors.amberAccent,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          // color: Colors.purple,
                          margin: EdgeInsets.fromLTRB(40, 30, 20, 0),
                          height: 200,
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Invoice To:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                widget.invoiceOrderModal.site,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 3),
                              Text(
                                widget.invoiceOrderModal.siteAddress,
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
                                'Shipping Address:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                widget.invoiceOrderModal.siteAddress,
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.red,
                          margin: EdgeInsets.fromLTRB(150, 30, 10, 0),
                          height: 200,
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Invoice Id:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                widget.invoiceOrderModal.invoiceId,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Order Date:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                widget.invoiceOrderModal.orderDate
                                    .split('T')[0],
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Delivered Date:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                widget.invoiceOrderModal.deliveryDate
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
                    // color: Colors.blueGrey,
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
                                      widget.invoiceOrderModal.orderId,
                                      style: TextStyle(
                                        height: 3
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.invoiceOrderModal.item,
                                      style: TextStyle(
                                        height: 3
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.invoiceOrderModal.price.toString() + '.00',
                                      style: TextStyle(
                                        height: 3
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.invoiceOrderModal.quantity.toString(),
                                      style: TextStyle(
                                        height: 3
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.invoiceOrderModal.amount.toString() + '.00',
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
                    // color: Colors.amberAccent,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          // color: Colors.purple,
                          margin: EdgeInsets.fromLTRB(40, 30, 25, 30),
                          height: 100,
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Generated By:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                widget.invoiceOrderModal.generatedUser,
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.red,
                          margin: EdgeInsets.fromLTRB(770, 30, 10, 30),
                          height: 100,
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                widget.invoiceOrderModal.amount.toString() + '.00',
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
