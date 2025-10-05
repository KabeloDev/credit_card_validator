import 'package:credit_card_validator/features/card_validation/domain/repositories/repository.dart';

class UpdateBannedCountries {
  final CardRepository repository;

  UpdateBannedCountries(this.repository);

  Future<void> call(List<String> countries) {
    return repository.updateBannedCountries(countries);
  }
}
