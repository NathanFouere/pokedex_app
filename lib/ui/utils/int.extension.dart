extension IntExt on int {
  String toRoman() {
    int value = this;
    final List<int> numbers = [
      1000,
      900,
      500,
      400,
      100,
      90,
      50,
      40,
      10,
      9,
      5,
      4,
      1,
    ];

    final List<String> romans = [
      "M",
      "CM",
      "D",
      "CD",
      "C",
      "XC",
      "L",
      "XL",
      "X",
      "IX",
      "V",
      "IV",
      "I",
    ];

    String roman = '';

    for (int i = 0; i < numbers.length; i++) {
      while (value >= numbers[i]) {
        roman += romans[i];
        value -= numbers[i];
      }
    }

    return roman;
  }
}
