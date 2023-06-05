import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class IndianRupeeFormatter {
  static String inegralValue = '';
  static String fractionalValue = '';
  static String decimalPoint = '.';

  static String amountFormatter(String text, TextEditingController controller) {
    var formatNumber = NumberFormat(
      '#,##,###',
    );
    // print(text);
    // print(controller);
    String rupeeSplittedText = text.split('₹').last.trim().toString();
    String replacedText = rupeeSplittedText.replaceAll(',', '').trim();
    int textLength = replacedText.length;
    print(replacedText);

    if (text.isEmpty) {
      controller.clear();
    } else if (replacedText.contains(decimalPoint)) {
      doubleValueFormating(formatNumber, text, controller);
    } else {
      if (textLength == 0) {
        controller.clear();
        controller.selection =
            TextSelection.fromPosition(const TextPosition(offset: 1));
      } else {
        controller.text =
            "₹${formatNumber.format(int.parse(replacedText.toString()))}";
        inegralValue = controller.text;
        controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length));
      }
    }
    return controller.text;
  }

  static void doubleValueFormating(
      NumberFormat formatter, String text, TextEditingController controller) {
    String formatString;
    List<String> textSplitted;
    print(text);

    if (text == decimalPoint) {
      controller.text = "₹0$decimalPoint";
      controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length));
    } else {
      formatString = text.split('₹').last.trim().toString();
      textSplitted = formatString.split(decimalPoint);

      // if (textSplitted.last == '') {
      //   textSplitted.last = textSplitted[1];
      // }

      // if (textSplitted.last.length > 2) {
      //   textSplitted.last = fractionalValue;
      // }
      // fractionalValue = textSplitted[1];

      controller.text =
          "₹${formatter.format(int.parse(textSplitted.first.toString())).toString()}$decimalPoint${textSplitted.last.toString().length > 2 ? textSplitted.last.toString().substring(0, 2).toString() : textSplitted.last.toString()}";

      controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length));
    }
  }
}
