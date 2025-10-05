import 'dart:convert';
import 'package:credit_card_validator/features/card_validation/data/datasources/local_data_source.dart';
import 'package:credit_card_validator/features/card_validation/data/models/credit_card_model.dart';
import 'package:credit_card_validator/features/card_validation/domain/entities/credit_card.dart';
import 'package:credit_card_validator/features/card_validation/domain/repositories/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardRepositoryImpl implements Repository {
  final LocalDataSource localDataSource;
  final SharedPreferences prefs;

  static const _cardsKey = 'cards';
  static const _bannedCountriesKey = 'banned_countries';

  CardRepositoryImpl({required this.localDataSource, required this.prefs});

  @override
  Future<void> addCard(CreditCard card, List<String> bannedCountries) async {
    if (bannedCountries.contains(card.issuingCountry)) {
      throw Exception('Cards from ${card.issuingCountry} are banned.');
    }

    final existingCards = await getCards();

    if (existingCards.any((c) => c.number == card.number)) {
      throw Exception('This card already exists.');
    }

    final models = existingCards
        .map((e) => CreditCardModel.fromEntity(e))
        .toList();
    models.add(CreditCardModel.fromEntity(card));

    final jsonList = models.map((m) => json.encode(m.toJson())).toList();
    await prefs.setStringList(_cardsKey, jsonList);
  }

  @override
  Future<List<CreditCard>> getCards() async {
    final jsonList = prefs.getStringList(_cardsKey) ?? [];

    final models = jsonList
        .map((str) => CreditCardModel.fromJson(json.decode(str)))
        .toList();

    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<String?> scanCard() async {
    return await localDataSource.scanCard();
  }

  @override
  Future<List<String>> getBannedCountries() async {
    return prefs.getStringList(_bannedCountriesKey) ?? [];
  }

  @override
  Future<void> updateBannedCountries(List<String> countries) async {
    await prefs.setStringList(_bannedCountriesKey, countries);
  }
}
