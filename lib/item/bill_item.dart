import 'package:flutter/material.dart';

class BillItem extends StatefulWidget {
  final String amount;
  final String dueDate;
  final String provider;
  final String customerId;
  final String package;
  final bool isSelected;
  final bool showDetails;
  final VoidCallback onTap;
  final VoidCallback onToggleDetails;
  final IconData icon; // Menambahkan properti ikon

  BillItem({
    required this.amount,
    required this.dueDate,
    required this.provider,
    required this.customerId,
    required this.package,
    required this.isSelected,
    required this.showDetails,
    required this.onTap,
    required this.onToggleDetails,
    required this.icon, // Menambahkan properti ikon
  });

  @override
  _BillItemState createState() => _BillItemState();
}

class _BillItemState extends State<BillItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(widget.icon), // Menggunakan ikon yang diberikan
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.amount,
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Due date on ${widget.dueDate}',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
                Spacer(),
                Checkbox(
                  value: widget.isSelected,
                  onChanged: (bool? value) {
                    widget.onTap();
                  },
                ),
              ],
            ),
            if (widget.showDetails) ...[
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Provider: ${widget.provider}'),
                    Text('ID Pelanggan: ${widget.customerId}'),
                    Text('Paket Layanan: ${widget.package}'),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: widget.onToggleDetails,
                  child: Text('Closed', style: TextStyle(color: Colors.red)),
                ),
              ),
            ] else ...[
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: widget.onToggleDetails,
                  child: Text('See Details', style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
