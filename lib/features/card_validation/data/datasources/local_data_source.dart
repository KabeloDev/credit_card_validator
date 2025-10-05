import 'dart:convert';
import 'package:card_scanner/card_scanner.dart';
import 'package:credit_card_validator/features/card_validation/data/models/credit_card_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

abstract class LocalDataSource {
  Future<void> cacheCard(CreditCardModel card);
  Future<List<CreditCardModel>> getCachedCards();
  Future<bool> cardExists(String number);
  Future<void> cacheBannedCountries(List<String> countries);
  Future<List<String>> getBannedCountries();
  Future<String?> scanCard();
}

const String cachedCardsKey = 'CACHED_CARDS';
const String bannedCountriesKey = 'BANNED_COUNTRIES';

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences prefs;
  final uuid = const Uuid();

  LocalDataSourceImpl(this.prefs);

  @override
  Future<void> cacheCard(CreditCardModel card) async {
    final current = await getCachedCards();
    current.add(card);
    final jsonList = current.map((c) => c.toJson()).toList();
    await prefs.setString(cachedCardsKey, jsonEncode(jsonList));
  }

  @override
  Future<List<CreditCardModel>> getCachedCards() async {
    final jsonString = prefs.getString(cachedCardsKey);
    if (jsonString == null) return [];
    final List decoded = jsonDecode(jsonString);
    return decoded.map((e) => CreditCardModel.fromJson(e)).toList();
  }

  @override
  Future<bool> cardExists(String number) async {
    final cards = await getCachedCards();
    return cards.any((c) => c.number == number);
  }

  @override
  Future<void> cacheBannedCountries(List<String> countries) async {
    await prefs.setString(bannedCountriesKey, jsonEncode(countries));
  }

  @override
  Future<List<String>> getBannedCountries() async {
    final jsonString = prefs.getString(bannedCountriesKey);
    if (jsonString == null) return [];
    final List decoded = jsonDecode(jsonString);
    return decoded.map((e) => e.toString()).toList();
  }

  @override
  Future<String?> scanCard() async {
    final result = await CardScanner.scanCard();
    return result?.cardNumber;
  }
}