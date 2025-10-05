import 'package:credit_card_validator/features/card_validation/domain/entities/credit_card.dart';

abstract class Repository {
  Future<void> addCard(CreditCard card, List<String> bannedCountries);

  Future<List<CreditCard>> getCards();

  Future<String?> scanCard();

  Future<void> updateBannedCountries(List<String> bannedCountries);

  Future<List<String>> getBannedCountries();
}