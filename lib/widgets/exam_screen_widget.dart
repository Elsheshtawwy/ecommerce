import 'package:flutter/material.dart';
import 'package:ecommerce/models/question.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExamScreenWidget extends StatelessWidget {
  final String selectedChapterKey;
  final List<Question> selectedQuestions;
  final int currentQuestionIndex;
  final List<String?> userAnswers;
  final Function(String?) onAnswerSelected;
  final VoidCallback goToPrevQuestion;
  final VoidCallback goToNextQuestion;
  final VoidCallback startExam;
  final int selectedTFCount;
  final int selectedMCCount;
  final List<Question> allQuestions;
  final Function(int) onTFCountChanged;
  final Function(int) onMCCountChanged;
  final AppLocalizations appLocalizations;

  const ExamScreenWidget({
    super.key,
    required this.selectedChapterKey,
    required this.selectedQuestions,
    required this.currentQuestionIndex,
    required this.userAnswers,
    required this.onAnswerSelected,
    required this.goToPrevQuestion,
    required this.goToNextQuestion,
    required this.startExam,
    required this.selectedTFCount,
    required this.selectedMCCount,
    required this.allQuestions,
    required this.onTFCountChanged,
    required this.onMCCountChanged,
    required this.appLocalizations,
  });

  @override
  Widget build(BuildContext context) {
    final bool isExamQuestionsLoaded = selectedQuestions.isNotEmpty;
    int maxTF = allQuestions.where((q) => q.type == 'tf').length;
    int maxMC = allQuestions.where((q) => q.type == 'mc').length;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:
          isExamQuestionsLoaded
              ? _buildExamContent(context)
              : _buildSelectionContent(context, maxTF, maxMC),
    );
  }

  Widget _buildSelectionContent(BuildContext context, int maxTF, int maxMC) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          appLocalizations.examChapter(
            int.parse(selectedChapterKey.replaceAll('ch', '')),
          ),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 24),
        _buildSliderSection(
          context,
          title: appLocalizations.selectTfQuestions,
          value: selectedTFCount,
          max: maxTF,
          onChanged: onTFCountChanged,
        ),
        const SizedBox(height: 16),
        _buildSliderSection(
          context,
          title: appLocalizations.selectMcQuestions,
          value: selectedMCCount,
          max: maxMC,
          onChanged: onMCCountChanged,
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed:
                (selectedTFCount == 0 && selectedMCCount == 0)
                    ? null
                    : startExam,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Text(
              appLocalizations.startExam,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  /// Helper method to build a slider section for question count selection.
  /// دالة مساعدة لبناء قسم شريط التمرير لاختيار عدد الأسئلة.
  Widget _buildSliderSection(
    BuildContext context, {
    required String
    title, // The title of the slider section (e.g., "Select TF questions")
    required int value, // The current selected value of the slider
    required int max, // The maximum value for the slider
    required Function(int) onChanged, // Callback when slider value changes
  }) {
    // If there are no questions of this type, the slider should not be interactive or should indicate 0.
    // إذا لم تكن هناك أسئلة من هذا النوع، يجب ألا يكون شريط التمرير تفاعليًا أو يجب أن يشير إلى 0.
    if (max == 0) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
            ),
            Text(
              appLocalizations.selectedCount(0), // No questions available
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyLarge),
        Slider(
          value: value.toDouble(),
          min: 1, // Minimum value is 1 question
          max:
              max.toDouble(), // Maximum value is the number of available questions of that type
          divisions:
              max > 1
                  ? max - 1
                  : 1, // Number of discrete divisions on the slider
          label:
              value
                  .round()
                  .toString(), // Label displayed when dragging the slider
          activeColor: Colors.teal, // Color of the slider track that is active
          inactiveColor:
              Colors
                  .teal
                  .shade100, // Color of the slider track that is inactive
          onChanged:
              (double v) => onChanged(v.round()), // Callback for value change
        ),
        Text(
          appLocalizations.selectedCount(value),
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.teal),
        ),
      ],
    );
  }

  Widget _buildExamContent(BuildContext context) {
    final Question currentQuestion = selectedQuestions[currentQuestionIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProgressBar(context),
        const SizedBox(height: 20),
        Text(
          appLocalizations.questionNumber(
            currentQuestionIndex + 1,
            currentQuestion.question,
          ),
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        if (currentQuestion.type == 'tf') ...[
          _buildOptionTile(
            context,
            label: appLocalizations.trueOption,
            value: 'T',
            groupValue: userAnswers[currentQuestionIndex],
          ),
          _buildOptionTile(
            context,
            label: appLocalizations.falseOption,
            value: 'F',
            groupValue: userAnswers[currentQuestionIndex],
          ),
        ] else if (currentQuestion.type == 'mc') ...[
          ...?currentQuestion.options?.map((option) {
            return _buildOptionTile(
              context,
              label: option,
              value: option,
              groupValue: userAnswers[currentQuestionIndex],
            );
          }).toList(),
        ],
        const SizedBox(height: 24),
        Row(
          children: [
            if (currentQuestionIndex > 0)
              OutlinedButton.icon(
                onPressed: goToPrevQuestion,
                icon: const Icon(Icons.arrow_back, color: Colors.teal),
                label: Text(
                  appLocalizations.previous,
                  style: const TextStyle(color: Colors.teal),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.teal),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: goToNextQuestion,
              icon: Icon(
                currentQuestionIndex == selectedQuestions.length - 1
                    ? Icons.check
                    : Icons.arrow_forward,
                color: Colors.white,
              ),
              label: Text(
                currentQuestionIndex == selectedQuestions.length - 1
                    ? appLocalizations.finishExam
                    : appLocalizations.next,
                style: const TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                elevation: 0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProgressBar(BuildContext context) {
    return Column(
      children: [
        Text(
          appLocalizations.questionProgress(
            currentQuestionIndex + 1,
            selectedQuestions.length,
          ),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: (currentQuestionIndex + 1) / selectedQuestions.length,
          backgroundColor: Colors.grey[200],
          color: Colors.teal,
          minHeight: 8,
        ),
      ],
    );
  }

  Widget _buildOptionTile(
    BuildContext context, {
    required String label,
    required String value,
    required String? groupValue,
  }) {
    return ListTile(
      title: Text(label, style: Theme.of(context).textTheme.bodyLarge),
      leading: Radio<String>(
        value: value,
        groupValue: groupValue,
        onChanged: onAnswerSelected,
        activeColor: Colors.teal,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
    );
  }
}
