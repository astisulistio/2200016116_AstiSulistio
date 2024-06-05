class Transaction {
  final String provider;
  final String date;
  final int amount;
  final String transactionId;
  final String packageName;
  final String customerId;
  final int billAmount;
  final int convenienceFee;

  Transaction(
      this.provider,
      this.date,
      this.amount,
      this.transactionId,
      this.packageName,
      this.customerId,
      this.billAmount,
      this.convenienceFee);
}
