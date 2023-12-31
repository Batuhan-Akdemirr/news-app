

import 'package:news_application/product/enums/supported_countries.dart';

extension SupportedCountryNameExtension on SupportedCountries {
  String get countryName {
    switch (this) {
      case SupportedCountries.ar:
        return 'Argentina'; 
      case SupportedCountries.de:
        return 'Germany';
      case SupportedCountries.fr:
        return 'France';
      case SupportedCountries.it:
        return 'Italia';
      case SupportedCountries.nl:
        return 'Netherlands';
      case SupportedCountries.no:
        return 'Norway';
      case SupportedCountries.pt:
        return 'Portugal';
      case SupportedCountries.ru:
        return 'Russia';
      case SupportedCountries.tr:
        return 'Turkey';
      case SupportedCountries.us:
        return 'United States';
    }
  }
}