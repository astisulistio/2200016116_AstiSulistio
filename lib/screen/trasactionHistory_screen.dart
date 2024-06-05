import 'package:flutter/material.dart';
import '../item/transaction.dart';
import 'transactionDetailsScreen.dart';

class TransactionHistoryScreen extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction('Nethome', '15 Feb 2024 10:32', 455000, 'BC444724669887648110', 'Nethome 100 Mbps', '1123645718921', 450000, 5000),
    Transaction('Bizzcom', '14 Feb 2024 16:12', 245000, 'BC123456789012345678', 'Bizzcom 50 Mbps', '1098765432109', 245000, 0),
    Transaction('Bizzcom', '16 Jan 2024 11:21', 245000, 'BC987654321098765432', 'Bizzcom 50 Mbps', '1098765432109', 245000, 0),
    Transaction('Nethome', '13 Jan 2024 09:25', 455000, 'BC112233445566778899', 'Nethome 100 Mbps', '1123645718921', 450000, 5000),
    Transaction('Bizzcom', '14 Dec 2024 17:45', 245000, 'BC998877665544332211', 'Bizzcom 50 Mbps', '1098765432109', 245000, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(transactions[index].provider[0]),
            ),
            title: Text(transactions[index].provider),
            subtitle: Text(transactions[index].date),
            trailing: Text('Rp${transactions[index].amount}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionDetailScreen(transaction: transactions[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
