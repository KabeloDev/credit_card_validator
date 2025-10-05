import 'package:credit_card_validator/features/card_validation/domain/entities/credit_card.dart';
import 'package:credit_card_validator/features/card_validation/domain/repositories/repository.dart';

class AddCard {
  final CardRepository repository;

  AddCard(this.repository);

  Future<void> call(CreditCard card, List<String> bannedCountries) {
    return repository.addCard(card, bannedCountries);
  }
}
