import 'package:card_scanner/features/card_validation/domain/entites/credit_card.dart';
import 'package:card_scanner/features/card_validation/domain/repositories/card_repository.dart';

class AddCard {
  final CardRepository repository;

  AddCard(this.repository);

  Future<void> call(CreditCard card, List<String> bannedCountries) {
    return repository.addCard(card, bannedCountries);
  }
}