import 'package:figma/screen/trasactionHistory_screen.dart';
import 'package:flutter/material.dart';
import 'package:figma/item/bill_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isBillSelected1 = false;
  bool isBillSelected2 = false;
  bool showDetails1 = false;
  bool showDetails2 = false;
  bool isAllSelected = false;
  double totalPayment = 0;

  void updateTotalPayment() {
    totalPayment = (isBillSelected1 ? 450000 : 0) + (isBillSelected2 ? 240000 : 0);
  }

  void toggleAllSelection(bool? value) {
    setState(() {
      isAllSelected = value ?? false;
      isBillSelected1 = isAllSelected;
      isBillSelected2 = isAllSelected;
      updateTotalPayment();
    });
  }

  void toggleBillSelection1(bool? value) {
    setState(() {
      isBillSelected1 = value ?? false;
      isAllSelected = isBillSelected1 && isBillSelected2;
      updateTotalPayment();
    });
  }

  void toggleBillSelection2(bool? value) {
    setState(() {
      isBillSelected2 = value ?? false;
      isAllSelected = isBillSelected1 && isBillSelected2;
      updateTotalPayment();
    });
  }

  void toggleDetails1() {
    setState(() {
      showDetails1 = !showDetails1;
    });
  }

  void toggleDetails2() {
    setState(() {
      showDetails2 = !showDetails2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.yellow[100],
            child: Row(
              children: [
                Icon(Icons.info_outline),
                SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    'Perlu diketahui, proses verifikasi transaksi dapat memakan waktu hingga 1x24 jam.',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CheckboxListTile(
              title: Text('Choose All'),
              value: isAllSelected,
              onChanged: toggleAllSelection,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                BillItem(
  amount: 'Rp450.000',
  dueDate: '16 Feb 2024',
  provider: 'Nethome',
  customerId: '112345718921',
  package: 'Nethome 100 Mbps',
  isSelected: isBillSelected1,
  showDetails: showDetails1,
  onTap: () => toggleBillSelection1(!isBillSelected1),
  onToggleDetails: toggleDetails1,
  icon: Icons.attach_money, // Menggunakan ikon uang untuk pembayaran Rp450.000
),
BillItem(
  amount: 'Rp240.000',
  dueDate: '20 Feb 2024',
  provider: 'Bnet',
  customerId: '',
  package: '',
  isSelected: isBillSelected2,
  showDetails: showDetails2,
  onTap: () => toggleBillSelection2(!isBillSelected2),
  onToggleDetails: toggleDetails2,
  icon: Icons.payment, // Menggunakan ikon pembayaran untuk pembayaran Rp240.000
),

                ListTile(
                  title: Text('Transaction History'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TransactionHistoryScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16.0),
          height: 150, // Sesuaikan tinggi container sesuai kebutuhan
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.receipt), // Menambahkan logo seperti bill
                      SizedBox(width: 8.0),
                      Text(
                        'Total Payment',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  Text(
                    'Rp$totalPayment',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  // Tindakan yang diambil saat tombol ditekan
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red), // Warna latar belakang tombol menjadi merah
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text('PAY NOW'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
