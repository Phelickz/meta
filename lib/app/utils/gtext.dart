library gtext;

import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'translator/google_translator.dart';

/// `GText` is a stateless widget that displays translated text
///
/// Base widget for rendering translated text default Flutter `Text` widget
///
/// Quick example of use:
/// ``` dart:
/// GText("Test msg", toLang: "de");
/// ```
///
/// Also you can customize your `GText` widget using the same styles as for the `Text` widget:
/// ``` dart:
/// GText(
///   "Test msg",
///   toLang: "de",
///   textAlign: TextAlign.center,
///   style: const TextStyle(
///     color: Colors.red,
///     fontSize: 15.0,
///     fontWeight: FontWeight.w600,
///   ),
/// );
/// ```
class GText extends StatelessWidget {
  static bool _enabled = true;
  static String? _from = "auto";
  static String _to = 'en';
  static bool _enableCaching = true;

  /// The text to translate and display.
  final String data;

  // The language code for translation
  final String? toLang;

  /// If non-null, the style to use for this text.
  ///
  /// If the style's "inherit" property is true, the style will be merged with
  /// the closest enclosing [DefaultTextStyle]. Otherwise, the style will
  /// replace the closest enclosing [DefaultTextStyle].
  final TextStyle? style;

  /// {@macro flutter.painting.textPainter.strutStyle}
  final StrutStyle? strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  ///
  /// This decides how [textAlign] values like [TextAlign.start] and
  /// [TextAlign.end] are interpreted.
  ///
  /// This is also used to disambiguate how to render bidirectional text. For
  /// example, if the [data] is an English phrase followed by a Hebrew phrase,
  /// in a [TextDirection.ltr] context the English phrase will be on the left
  /// and the Hebrew phrase to its right, while in a [TextDirection.rtl]
  /// context, the English phrase will be on the right and the Hebrew phrase on
  /// its left.
  ///
  /// Defaults to the ambient [Directionality], if any.
  final TextDirection? textDirection;

  /// Used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale.
  ///
  /// It's rarely necessary to set this property. By default its value
  /// is inherited from the enclosing app with `Localizations.localeOf(context)`.
  ///
  /// See [RenderParagraph.locale] for more information.
  final Locale? locale;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.
  final bool? softWrap;

  /// How visual overflow should be handled.
  ///
  /// If this is null [TextStyle.overflow] will be used, otherwise the value
  /// from the nearest [DefaultTextStyle] ancestor will be used.
  final TextOverflow? overflow;

  /// The number of font pixels for each logical pixel.
  ///
  /// For example, if the text scale factor is 1.5, text will be 50% larger than
  /// the specified font size.
  ///
  /// The value given to the constructor as textScaleFactor. If null, will
  /// use the [MediaQueryData.textScaleFactor] obtained from the ambient
  /// [MediaQuery], or 1.0 if there is no [MediaQuery] in scope.
  final double? textScaleFactor;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be truncated according
  /// to [overflow].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  ///
  /// If this is null, but there is an ambient [DefaultTextStyle] that specifies
  /// an explicit number for its [DefaultTextStyle.maxLines], then the
  /// [DefaultTextStyle] value will take precedence. You can use a [RichText]
  /// widget directly to entirely override the [DefaultTextStyle].
  final int? maxLines;

  /// {@template flutter.widgets.Text.semanticsLabel}
  /// An alternative semantics label for this text.
  ///
  /// If present, the semantics of this widget will contain this value instead
  /// of the actual text. This will overwrite any of the semantics labels applied
  /// directly to the [TextSpan]s.
  ///
  /// This is useful for replacing abbreviations or shorthands with the full
  /// text value:
  ///
  /// ```dart
  /// Text(r'$$', semanticsLabel: 'Double dollars')
  /// ```
  /// {@endtemplate}
  final String? semanticsLabel;

  /// {@macro flutter.painting.textPainter.textWidthBasis}
  final TextWidthBasis? textWidthBasis;

  /// {@macro dart.ui.textHeightBehavior}
  final TextHeightBehavior? textHeightBehavior;

  /// The color to use when painting the selection.
  final Color? selectionColor;

  /// `GText` constructor by default require only text data as unnamed argument
  ///
  /// Args:
  ///
  /// __Required:__
  /// - __data__ (_String_): The input string data to be translated and displayed;
  ///
  /// __Else:__
  /// - __toLang__ (_String?_): The language code of the desired language of translation;
  /// - __style__ (_TextStyle?_): The basic `TextStyle` class from Flutter;
  /// - __strutStyle__ (_StrutStyle?_): The basic `StrutStyle` class from Flutter;
  /// - __textAlign__ (_TextAlign?_): Defines the text alignment;
  /// - __textDirection__ (_TextDirection?_): Defines the direction of the text;
  /// - __locale__ (Locale?): Defines the specific locale for flutter mechanisms;
  /// - __softWrap__ (_bool?_): Whether the text should break at soft line breaks.;
  /// - __overflow__ (_TextOverflow?_): Defines the behavior for text overflowing;
  /// - __textScaleFactor__ (_double?_): Defines basic text scale factor;
  /// - __maxLines__ (_int?_): Defines the maximum of lines to be rendered;
  /// - __semanticsLabel__ (_String?_): If present, the semantics of this widget will contain this value instead of the actual text;
  /// - __textWidthBasis__ (_TextWidthBasis?_): The different ways of measuring the width of one or more lines of text.;
  /// - __textHeightBehavior__ (_TextHeightBehavior?_): Defines how to apply TextStyle.height over and under text.;
  /// - __selectionColor__ (_Color?_): The color to use when painting the selection.
  ///
  /// Quick example of use:
  /// ``` dart:
  /// GText("Test msg", toLang: "de");
  /// ```
  ///
  /// Also you can customize your `GText` widget using the same styles as for the `Text` widget:
  /// ``` dart:
  /// GText(
  ///   "Test msg",
  ///   toLang: "de",
  ///   textAlign: TextAlign.center,
  ///   style: const TextStyle(
  ///     color: Colors.red,
  ///     fontSize: 15.0,
  ///     fontWeight: FontWeight.w600,
  ///   ),
  /// );
  /// ```
  const GText(
    this.data, {
    Key? key,
    this.toLang,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : super(key: key);

  /// `init` function is setting configuration for `GText` widgets
  ///
  /// Args:
  /// - __from__ (_String_): The language code of the text to be translated. If not specified, the language is auto-detected.
  /// - __to__ (_String_): The language to translate to.
  /// - __enableCaching__ (_bool_): If true, the translation will be cached.
  static void init({
    String? from = "auto",
    required String to,
    required bool enableCaching,
  }) {
    _from = from;
    _to = to;
    _enableCaching = enableCaching;
  }

  /// Enable/disable translate functions. In case it's disabled, `GText` will render non-translated text.
  /// Default state is enabled.
  static set enabled(bool isEnabled) {
    _enabled = isEnabled;
  }

  /// `translate(...)` is a function that takes a string and a language code as parameters and returns a translated
  /// string
  ///
  /// If `toLang` is not set, it will translate to global language (default: 'en')
  ///
  /// Args:
  ///  -  __text__ (_String_): The text to be translated.
  ///  - __toLang__ (_String?_): The language you want to translate to.
  ///
  /// Returns:
  ///   - If translation for the same `text` and `toLang` were stored locally - will returned cached translation;
  ///   - In case of unexpected exceptions will return `text` variable;
  ///   - Otherwise will return __translated text__;
  static Future<String> translate({
    required String text,
    String? toLang,
  }) async {
    if (!GText._enabled || text.trim().isEmpty) {
      return text;
    }

    if (GText._enableCaching) {
      final cachedTranslation = await _loadTranslation(
        key: text,
        to: GText._to,
      );

      if (cachedTranslation is String) {
        return cachedTranslation;
      }
    }

    final translator = GoogleTranslator();

    try {
      final translation = await translator.translate(
        text,
        to: toLang ?? GText._to,
        from: GText._from ?? 'auto',
      );

      if (GText._enableCaching && translation.text != translation.source) {
        await _saveTranslation(
          key: text,
          to: GText._to,
          translation: translation.text,
        );
      }

      return translation.text;
    } catch (ex) {
      log(
        ex.toString(),
        name: "GText",
      );

      return text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: GText.translate(text: data, toLang: toLang),
      builder: (context, snapshot) {
        return Text(
          snapshot.data ?? "",
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          selectionColor: selectionColor,
        );
      },
    );
  }

  /// `_saveTranslation(...)` saves translation for specific key
  ///
  /// Args:
  ///   - __key__ (_String_): The key of the translation.
  ///   - __to__ (_String_): The language to translate to.
  ///   - __translation__ (_String_): The translation to save.
  static Future<void> _saveTranslation({
    required String key,
    required String to,
    required String translation,
  }) async {
    final preferences = await SharedPreferences.getInstance();

    final result = await preferences.setString(
      "translations/$to/$key",
      translation,
    );

    if (!result) {
      throw "Unable to save translation cache locally";
    }
  }

  /// `_loadTranslation(...)` loads a translation from the device's storage
  ///
  /// Args:
  ///   - __key__ (_String_): The key of the translation you want to load.
  ///   - __to__ (_String_): The language you want to translate to.
  ///
  /// Returns:
  ///   - __Future<String?>__ object, that may contains locally saved translation
  static Future<String?> _loadTranslation({
    required String key,
    required String to,
  }) async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getString("translations/$to/$key");
  }
}
