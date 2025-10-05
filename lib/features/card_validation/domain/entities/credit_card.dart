class CreditCard {
  final String id;
  final String number;
  final String cardType;
  final String cvv;
  final String issuingCountry;

  const CreditCard({
    required this.id,
    required this.number,
    required this.cardType,
    required this.cvv,
    required this.issuingCountry,
  });
}
