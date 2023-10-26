import 'package:news_application/product/enums/supported_countries.dart';

extension SupportedCountriesExtension on SupportedCountries {
  String get assetName => "assets/flags/$name.png";
}
