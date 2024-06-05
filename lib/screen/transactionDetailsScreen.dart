import 'package:flutter/material.dart';
import '../item/transaction.dart';

class TransactionDetailScreen extends StatelessWidget {
  final Transaction transaction;

  TransactionDetailScreen({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 100,
                    color: Colors.green,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Rp ${transaction.amount}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Pembayaran Berhasil',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            buildTransactionDetailRow('Provider', transaction.provider),
            buildTransactionDetailRow('ID Pelanggan', transaction.customerId),
            buildTransactionDetailRow('Paket Layanan', transaction.packageName),
            buildTransactionDetailRow('No. Transaksi', transaction.transactionId),
            buildTransactionDetailRow('Waktu Transaksi', transaction.date),
            buildTransactionDetailRow('Jumlah Tagihan', 'Rp${transaction.billAmount}'),
            buildTransactionDetailRow('Convenience Fee', 'Rp${transaction.convenienceFee}'),
            buildTransactionDetailRow('Payment Method', 'BCA Virtual Account'),
            SizedBox(height: 16.0),
            Text(
              'Proses verifikasi transaksi dapat memakan waktu hingga 1x24 jam.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
