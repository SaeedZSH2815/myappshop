import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../providers/orders.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart' as orderunit;
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders')),
      drawer: MyAppDrawer(),
      body: ListView.builder(
        itemCount: ordersData.itemOrders.length,
        itemBuilder: (context, index) {
          return orderunit.OrderItem(order: ordersData.itemOrders[index]);
        },
      ),
    );
  }
}
