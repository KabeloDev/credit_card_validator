import 'package:credit_card_validator/features/card_validation/domain/repositories/repository.dart';

class UpdateBannedCountries {
  final Repository repository;

  UpdateBannedCountries(this.repository);

  Future<void> call(List<String> countries) {
    return repository.updateBannedCountries(countries);
  }
}
