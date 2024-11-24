import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['he', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? heText = '',
    String? enText = '',
  }) =>
      [heText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // start_onboarding
  {
    'u0ru7a5r': {
      'he': 'שאלון קצר שיעזור לנו\nלהכיר אותך יותר טוב',
      'en': '',
    },
    's2zj0z44': {
      'he': 'החלק הזה חשוב כדי שנדע להתאים לך שיעורים נכונים',
      'en': '',
    },
    'ntjwkrtl': {
      'he': 'התנתק',
      'en': '',
    },
  },
  // question
  {
    '4gc0ips9': {
      'he': 'קודם',
      'en': '',
    },
    '7gdcs4kc': {
      'he': 'המשך',
      'en': '',
    },
    'i3taw491': {
      'he': 'Home',
      'en': '',
    },
  },
  // homepage
  {
    'kxkjhfmx': {
      'he': 'תרגול הגייה נכונה',
      'en': '',
    },
    'rptsh3z4': {
      'he': 'יומיום',
      'en': '',
    },
    'u06mye1i': {
      'he': 'דרגו אותנו!',
      'en': '',
    },
    '9qghqauj': {
      'he': 'Home',
      'en': '',
    },
  },
  // start_dialog
  {
    'bdnitpy6': {
      'he': 'בחר את האפשרות שמתאימה לך',
      'en': '',
    },
    '4g2ls3jt': {
      'he': '',
      'en': '',
    },
    '5a4mjtyz': {
      'he': 'התחלת שיחה',
      'en': '',
    },
    '5c1d8y3x': {
      'he': '',
      'en': '',
    },
  },
  // profile
  {
    'xdz9zcbe': {
      'he': 'פרופיל תלמיד',
      'en': '',
    },
    '46zei3il': {
      'he': 'הגשמת מטרות אישיות',
      'en': '',
    },
    'yx3m9nde': {
      'he': 'שיחות אחרונות',
      'en': '',
    },
  },
  // settings
  {
    '5kd8b0gs': {
      'he': 'הגדרות',
      'en': '',
    },
    'lzn2kvmu': {
      'he': 'TextField',
      'en': '',
    },
    'ae22v0be': {
      'he': 'העדפות תחומי עניין',
      'en': '',
    },
    'lps9l0b0': {
      'he': 'שינוי רמת אנגלית',
      'en': '',
    },
    'fewzb0vf': {
      'he': 'יעדים ומטרות',
      'en': '',
    },
    '1f2a6tse': {
      'he': 'תזכורות לשיעורים',
      'en': '',
    },
    'ivz59lac': {
      'he': 'התראות',
      'en': '',
    },
    '4pb1ixf3': {
      'he': 'שמירת השינויים',
      'en': '',
    },
    'a81nlu84': {
      'he': 'תמיכה טכנית',
      'en': '',
    },
    'ug6nxk63': {
      'he': 'מחיקת משתמש',
      'en': '',
    },
    'cpn81lj7': {
      'he': 'Home',
      'en': '',
    },
  },
  // dialog_summary
  {
    'zqep0wmv': {
      'he': 'שיחה',
      'en': '',
    },
    'fegks4us': {
      'he': 'השיעור הסתיים. כל הכבוד!',
      'en': '',
    },
    'y3awxofa': {
      'he': 'הגשמת מטרות אישיות',
      'en': '',
    },
    'epc1gnmn': {
      'he': 'סיכום שיחה',
      'en': '',
    },
    '5b905i4l': {
      'he': '* זמן הצפייה בתמלול מוגבל בזמן',
      'en': '',
    },
    'y3jerh1w': {
      'he': 'Home',
      'en': '',
    },
  },
  // loader
  {
    'vh2zj7nw': {
      'he': 'Dialogi',
      'en': '',
    },
    'cxtn6hap': {
      'he': 'Home',
      'en': '',
    },
  },
  // login
  {
    'l91ypzi9': {
      'he': 'למידת אנגלית מדוברת\n מעולם לא הייתה פשוטה יותר',
      'en': '',
    },
    'bc38g8c4': {
      'he': 'Home',
      'en': '',
    },
  },
  // on_dialog_chat
  {
    'fb7kzi9n': {
      'he': 'שיחה',
      'en': '',
    },
    'jui9r5k9': {
      'he': 'סיים שיחה',
      'en': '',
    },
    'pufcxa3k': {
      'he': 'חזור שנית',
      'en': '',
    },
    'zmg8n5t3': {
      'he': 'Button',
      'en': '',
    },
    '887s7ijl': {
      'he': 'מעבר לעמוד הבית',
      'en': '',
    },
    'of1rw672': {
      'he': 'Home',
      'en': '',
    },
  },
  // dialogManager
  {
    '44gdvqrs': {
      'he': 'סיים שיחה',
      'en': '',
    },
    'e1i26492': {
      'he': 'חזור שנית',
      'en': '',
    },
    't6uxo2fs': {
      'he': 'Button',
      'en': '',
    },
  },
  // bottomQuestion
  {
    'jrbba0gz': {
      'he': 'עדכן',
      'en': '',
    },
  },
  // Button
  {
    'jak0b330': {
      'he': 'Get Started',
      'en': '',
    },
  },
  // newBtn
  {
    'zeg2qsb1': {
      'he': '',
      'en': '',
    },
  },
  // primaryBtn
  {
    'pfdg4jox': {
      'he': '',
      'en': '',
    },
  },
  // popupLessonsAlert
  {
    'fo3rp6wi': {
      'he': 'תזכורות לשיעורים',
      'en': '',
    },
  },
  // bottomQuestionCopy
  {
    'nqxbfr24': {
      'he': 'שינוי רמת אנגלית',
      'en': '',
    },
    '5lhna1tv': {
      'he': '*רמת השיעורים תשתנה בהתאם לבחירתך',
      'en': '',
    },
    '3dcfwwht': {
      'he': 'עדכן',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '493ycvi4': {
      'he': 'Button',
      'en': '',
    },
    'sgm9ww6o': {
      'he': 'Option 1',
      'en': '',
    },
    'sfbyapp3': {
      'he': 'This app requires microphone usage.',
      'en': '',
    },
    '6cmeu9ig': {
      'he': 'This app requires speech recognize.',
      'en': '',
    },
    'yj8yjvjn': {
      'he': 'This app requires microphone usage.',
      'en': '',
    },
    '58fj47f0': {
      'he': ' gugyg yt ffbfvyu v g tft',
      'en': '',
    },
    '7vnbs00x': {
      'he': '',
      'en': '',
    },
    'gl8mn1ta': {
      'he': '',
      'en': '',
    },
    '2ya0vzuh': {
      'he': '',
      'en': '',
    },
    '7rph1jj9': {
      'he': '',
      'en': '',
    },
    'lussjcxj': {
      'he': '',
      'en': '',
    },
    'rtljsm5v': {
      'he': '',
      'en': '',
    },
    'zkd2t4tr': {
      'he': '',
      'en': '',
    },
    'u94bpk2g': {
      'he': '',
      'en': '',
    },
    'lgpmxgii': {
      'he': '',
      'en': '',
    },
    'fm55pw2z': {
      'he': '',
      'en': '',
    },
    'iporrnd2': {
      'he': '',
      'en': '',
    },
    'ekhjkfw6': {
      'he': '',
      'en': '',
    },
    'cogonpci': {
      'he': '',
      'en': '',
    },
    'fgt2tz6v': {
      'he': '',
      'en': '',
    },
    'ia6crre0': {
      'he': '',
      'en': '',
    },
    'hlov9abj': {
      'he': '',
      'en': '',
    },
    'xkq44efn': {
      'he': '',
      'en': '',
    },
    'pqy5i23b': {
      'he': '',
      'en': '',
    },
    'co9oyhj5': {
      'he': '',
      'en': '',
    },
    'a6z3615x': {
      'he': '',
      'en': '',
    },
    '8iybvgrx': {
      'he': '',
      'en': '',
    },
    'yz49i9as': {
      'he': '',
      'en': '',
    },
    '8citc0vl': {
      'he': '',
      'en': '',
    },
    'yz3og4nv': {
      'he': '',
      'en': '',
    },
    'pwmeeq7x': {
      'he': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
