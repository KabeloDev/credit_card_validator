abstract class BannedCountryEvent {}

class LoadBannedCountries extends BannedCountryEvent {}

class AddBannedCountry extends BannedCountryEvent {
  final String country;
  AddBannedCountry(this.country);
}

class EditBannedCountry extends BannedCountryEvent {
  final int index;
  final String country;
  EditBannedCountry(this.index, this.country);
}

class DeleteBannedCountry extends BannedCountryEvent {
  final int index;
  DeleteBannedCountry(this.index);
}
