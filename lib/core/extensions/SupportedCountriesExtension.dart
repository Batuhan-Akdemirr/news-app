import 'package:news_application/core/enums/SupportedCountries.dart';

extension SupportedCountriesExtension on SupportedCountries {
  String get assetName => "assets/flags/${this.name}.png";
}
