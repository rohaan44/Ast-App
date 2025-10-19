import 'package:flutter/services.dart';

class InputFormatterHelper {
  static List<TextInputFormatter> denyEmptySpace = [
    FilteringTextInputFormatter.deny(" "),
    // FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
  ];
  static TextInputFormatter onlyZeroIndex =
      FilteringTextInputFormatter.deny(" ");

  static List<TextInputFormatter> allowCharactersAndSpace = [
    // FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z ]")),
    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
    // FilteringTextInputFormatter.deny(RegExp('(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'))
  ];

  static final RegExp hiddenEmojiRegex = RegExp(
    r'[\u{200D}\u{FE0F}]', // Zero Width Joiner and Variation Selector-16
    unicode: true,
  );
  static List<TextInputFormatter> allowCharactersNumbersAndSpace = [
    FilteringTextInputFormatter.allow(RegExp("[0-9 a-zA-Z ]")),
    FilteringTextInputFormatter.deny(RegExp(
        '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
  ];

  static List<TextInputFormatter> ibanOrNumberFormatter = [
    FilteringTextInputFormatter.allow(RegExp("[0-9 a-zA-Z-]")),
    FilteringTextInputFormatter.deny(RegExp(
        '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
  ];

  static List<TextInputFormatter> emailFormatter = [
    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9@._-]")),
  ];

  static List<TextInputFormatter> addressFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9/\\\-, ]"))
  ];

  static List<TextInputFormatter> denySpaceAndOnlyAllowNumbers = [
    FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
    ...denyEmptySpace,
  ];

  // static List<TextInputFormatter> currencyFormatter = [
  //   CurrencyInputFormatter(
  //     thousandSeparator: ThousandSeparator.Comma,
  //   ),
  // ];

  // static List<TextInputFormatter> mobileNumberFormatter = [
  //   FourSpaceInputFormatter(),
  //   // ...denyEmptySpace,
  // ];
}
