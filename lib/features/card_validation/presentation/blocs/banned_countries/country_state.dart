abstract class BannedCountriesState {}

class BannedCountriesLoading extends BannedCountriesState {}

class BannedCountriesLoaded extends BannedCountriesState {
  final List<String> countries;
  BannedCountriesLoaded(this.countries);
}
