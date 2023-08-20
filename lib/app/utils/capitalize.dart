/// Matches all characteres
final foundLetters = RegExp(r'\w+.');

extension ListCapilize on List<String> {
  /// Make first letter to capital to all items of this List<String>
  List<String> capitalize() {
    return map((e) => e.capitalize()).toList();
  }
}

extension StringCapitalize on String {
  /// Does transform uppercase first letter of this string
  /// and this is be empty, returns an empty
  /// string.
  ///
  /// To uppercase first letter of this string:
  /// ```dart
  /// 'dart'.capitalizeOrFail() // Dart
  /// ```
  String capitalize() {
    if (isEmpty) return '';

    return _makeCapitalization();
  }

  /// Does transform uppercase first letter of this string
  /// or throw an exception if this string
  /// is be empty.
  ///
  /// To uppercase first letter of this string:
  /// ```dart
  /// 'dart'.capitalizeOrFail() // Dart
  /// ```
  String capitalizeOrFail() {
    if (isEmpty) {
      throw const StringDoesNotBeEmptyException();
    }

    return _makeCapitalization();
  }

  /// Does transform uppercase first letter for all words of this string
  /// or throw an exception if this string
  /// is be empty.
  ///
  /// To uppercase first letter of all words this string:
  /// ```dart
  /// 'I like dart language'.capitalizeEachOrFail() // I Like Dart Language
  /// 'I  like dart   language'.capitalizeEachOrFail() // I  Like Dart   Language
  /// ```
  String capitalizeEachOrFail() {
    if (isEmpty) {
      throw const StringDoesNotBeEmptyException();
    }

    return _makeCapitalization();
  }

  /// Does transform uppercase first letter for all words
  /// of this string or throw an exception if this string
  /// is be empty.
  ///
  /// To uppercase first letter for all words of this string:
  /// ```dart
  /// 'I like dart language'.capitalizeEach() // I Like Dart Language
  /// 'I  like dart   language'.capitalizeEach() // I  Like Dart   Language
  /// ```
  String capitalizeEach() {
    if (isEmpty) return '';

    return _makeCapitalizationEach();
  }

  /// Does uppercase first letter for all words
  /// of this string
  String _makeCapitalizationEach() {
    final words = <String>[];
    var oldEnd = 0;

    foundLetters.allMatches(this).map((e) {
      var indexWord = oldEnd;

      /// Get word by start and end indexes
      final word = substring(e.start, e.end).capitalize();

      while (indexWord != e.start) {
        words.add(' ');
        indexWord++;
      }

      oldEnd = e.end;
      words.add(word);
    }).toList();

    return words.join();
  }

  /// Method verify if this String starts with
  /// a capital letter
  bool startsWithCapital() {
    final text = this[0];
    return text == text.toUpperCase();
  }

  /// Does transform first letter of
  /// this string to uppercase.
  String _makeCapitalization() {
    final firstLetter = this[0].toUpperCase();
    final restLetters = substring(1, length);

    return '$firstLetter$restLetters';
  }
}

abstract class StringException implements Exception {
  const StringException([this.error]);

  final dynamic error;
}

class StringDoesNotBeEmptyException extends StringException {
  const StringDoesNotBeEmptyException() : super('String does not be [empty]');

  @override
  String toString() => error;
}
