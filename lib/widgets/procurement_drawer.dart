import 'package:flutter/material.dart';
import 'package:procurement_management_system_web_frontend/pages/home.dart';
import 'package:procurement_management_system_web_frontend/pages/invoices.dart';
import 'package:procurement_management_system_web_frontend/pages/orders.dart';
import 'package:provider/provider.dart';

class ProcurementDrawer extends StatefulWidget {
  const ProcurementDrawer({Key? key}) : super(key: key);

  @override
  _ProcurementDrawerState createState() => _ProcurementDrawerState();
}

class _ProcurementDrawerState extends State<ProcurementDrawer> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.purple.shade800,
        child: ListView(
          children: <Widget>[
            Container(
                padding: padding,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Center(
                        child: Icon(
                          Icons.construction,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Divider(color: Colors.white70),
                    const SizedBox(height: 12),
                    buildMenuItem(
                        text: 'Home',
                        icon: Icons.home,
                        onClicked: () => selectedItem(context, 0)),
                    const SizedBox(height: 3),
                    buildMenuItem(
                        text: 'Pending Orders',
                        icon: Icons.pending_actions,
                        onClicked: () => selectedItem(context, 1)),
                    const SizedBox(height: 3),
                    buildMenuItem(
                        text: 'Approved Orders',
                        icon: Icons.done_all,
                        onClicked: () => selectedItem(context, 2)),
                    const SizedBox(height: 3),
                    buildMenuItem(
                        text: 'Held Orders',
                        icon: Icons.pending_outlined,
                        onClicked: () => selectedItem(context, 3)),
                    const SizedBox(height: 3),
                    buildMenuItem(
                        text: 'Referred Orders',
                        icon: Icons.supervised_user_circle,
                        onClicked: () => selectedItem(context, 4)),
                    const SizedBox(height: 3),
                    buildMenuItem(
                        text: 'Invoices',
                        icon: Icons.receipt_long_outlined,
                        onClicked: () => selectedItem(context, 5)),
                    const SizedBox(height: 3),
                    buildMenuItem(
                        text: 'Statistics',
                        icon: Icons.show_chart,
                        onClicked: () => selectedItem(context, 6)),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    // final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      // hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Home(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Orders(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Orders(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Orders(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Orders(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Invoices(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Invoices(),
        ));
        break;
    }
  }
}
