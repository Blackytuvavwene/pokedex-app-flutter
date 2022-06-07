class AppStrings {
  static const String title = 'Pokedex';
  static const String search =
      'Search a Pokemon by name or using it\'s National Pokedex number.';
  static const String error = 'Error';
  static const String errorMessage = 'An error has occurred.';
  static const String searchInput = 'Name or number';
}

// function to upper case first letter of string
String upperCaseFirstLetter(String s) {
  if (s.isEmpty) return '';
  return s[0].toUpperCase() + s.substring(1);
}
