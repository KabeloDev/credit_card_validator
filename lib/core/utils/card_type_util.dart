String inferCardType(String cardNumber) {
  final cleanedCardNumber = cardNumber.replaceAll(' ', '');

  if (cleanedCardNumber.isEmpty) return 'Unknown';

  if (RegExp(r'^4[0-9]{6,}$').hasMatch(cleanedCardNumber)) {
    return 'Visa';
  } else if (RegExp(r'^(5[1-5][0-9]{5,}|2(2[2-9][0-9]{4,}|[3-6][0-9]{5,}|7[01][0-9]{4,}|720[0-9]{3,}))$')
      .hasMatch(cleanedCardNumber)) {
    return 'MasterCard';
  } else if (RegExp(r'^3[47][0-9]{5,}$').hasMatch(cleanedCardNumber)) {
    return 'American Express';
  } else if (RegExp(r'^6(?:011|5[0-9]{2})[0-9]{3,}$').hasMatch(cleanedCardNumber)) {
    return 'Discover';
  } else {
    return 'Unknown';
  }
}
  