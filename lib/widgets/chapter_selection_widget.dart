import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// A widget for selecting chapters and displaying associated exam buttons.
/// ويدجت لاختيار الفصول وعرض أزرار الاختبارات المرتبطة بها.
class ChapterSelectionWidget extends StatelessWidget {
  /// Callback function when a chapter is selected.
  /// دالة رد الاتصال عند اختيار فصل.
  final Function(String chapterKey, String chapterTitle) onChapterSelected;

  // Removed showTests as it's no longer needed
  // تم إزالة showTests لأنه لم يعد ضروريًا

  /// The title of the currently selected chapter. (Not used directly here anymore, but kept for clarity)
  /// عنوان الفصل المحدد حاليًا. (لم يعد يستخدم هنا مباشرةً، ولكن تم الاحتفاظ به للوضوح)
  final String selectedChapterTitle;

  /// Dummy map for chapter links (not directly used for navigation in Flutter, but for chapter mapping).
  /// خريطة وهمية لروابط الفصول (لا تستخدم مباشرة للتنقل في Flutter، ولكن لتعيين الفصل).
  final Map<String, List<String>> chapterLinks;

  // Removed onStartExam as chapter selection now directly initiates exam setup
  // تم إزالة onStartExam حيث أن اختيار الفصل يبدأ إعداد الاختبار مباشرةً

  /// Localized strings for the application.
  /// سلاسل الترجمة الخاصة بالتطبيق.
  final AppLocalizations appLocalizations;

  /// List of chapter keys that actually have questions and should be displayed.
  /// قائمة بمفاتيح الفصول التي تحتوي بالفعل على أسئلة ويجب عرضها.
  final List<String> availableChapterKeys;

  const ChapterSelectionWidget({
    super.key,
    required this.onChapterSelected,
    // removed showTests
    required this.selectedChapterTitle,
    required this.chapterLinks,
    // removed onStartExam
    required this.appLocalizations,
    required this.availableChapterKeys,
  });

  @override
  Widget build(BuildContext context) {
    // Helper function to get localized chapter title
    // دالة مساعدة للحصول على عنوان الفصل المترجم
    String getChapterTitle(String key) {
      switch (key) {
        case 'ch1': return appLocalizations.chapterOne;
        case 'ch2': return appLocalizations.chapterTwo;
        case 'ch3': return appLocalizations.chapterThree;
        case 'ch4': return appLocalizations.chapterFour;
        case 'ch5': return appLocalizations.chapterFive;
        case 'ch6': return appLocalizations.chapterSix;
        case 'ch7': return appLocalizations.chapterSeven;
        default: return key;
      }
    }

    return Column(
      children: [
        Text(
          appLocalizations.selectChapter,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 25),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 10.0,
          runSpacing: 10.0,
          children: availableChapterKeys.map((key) {
            final String chapterTitle = getChapterTitle(key);
            return ElevatedButton(
              onPressed: () => onChapterSelected(key, chapterTitle), 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00BCD4),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 4.0,
                shadowColor: Colors.black.withOpacity(0.1),
                textStyle: Theme.of(context).textTheme.labelLarge,
              ).copyWith(
                overlayColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.hovered)) {
                      return const Color(0xFF0097A7).withOpacity(0.8);
                    }
                    return null;
                  },
                ),
                elevation: WidgetStateProperty.resolveWith<double?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.hovered)) {
                      return 8.0;
                    }
                    return 4.0;
                  },
                ),
              ),
              child: Text(chapterTitle),
            );
          }).toList(),
        ),
      ],
    );
  }
}
