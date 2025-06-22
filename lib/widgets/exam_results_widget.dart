import 'package:flutter/material.dart';
import 'package:ecommerce/models/question.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:video_player/video_player.dart';


class ExamResultsWidget extends StatelessWidget {
  final List<Question> selectedQuestions;
  final List<String?> userAnswers;
  final VoidCallback onResetExam;
  final AppLocalizations appLocalizations;

  const ExamResultsWidget({
    super.key,
    required this.selectedQuestions,
    required this.userAnswers,
    required this.onResetExam,
    required this.appLocalizations,
  });

  @override
  Widget build(BuildContext context) {
    int score = 0;
    List<Map<String, String?>> incorrectAnswers = [];

    for (int i = 0; i < selectedQuestions.length; i++) {
      if (userAnswers[i] == selectedQuestions[i].answer) {
        score++;
      } else {
        incorrectAnswers.add({
          'question': selectedQuestions[i].question,
          'correctAnswer': selectedQuestions[i].answer,
          'userAnswer': userAnswers[i],
        });
      }
    }

    double percentage = (score / selectedQuestions.length) * 100;

    String getResultMessage() {
      if (percentage == 100) {
        return appLocalizations.perfectScore;
      } else if (percentage >= 80) {
        return appLocalizations.veryGoodScore;
      } else if (percentage >= 50) {
        return appLocalizations.goodScore;
      } else {
        return appLocalizations.tryAgainMessage;
      }
    }

    String getVideoAssetPath() {
      if (percentage == 100) {
        return 'assets/videos/perfect_score.mp4';
      } else if (percentage >= 80) {
        return 'assets/videos/very_good_score.mp4';
      } else if (percentage >= 50) {
        return 'assets/videos/good_score.mp4';
      } else {
        return 'assets/videos/try_again.mp4';
      }
    }

    final String videoAssetPath = getVideoAssetPath();

    return Column(
      children: [
        Text(
          appLocalizations.results,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        Text(
          appLocalizations.scoreMessage(score, selectedQuestions.length),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                getResultMessage(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color:
                      percentage == 100
                          ? Colors.green
                          : (percentage >= 80
                              ? Colors.teal
                              : (percentage >= 50
                                  ? Colors.orange
                                  : Colors.red)),
                ),
              ),
                const SizedBox(height: 16),
                SizedBox(
                height: 300, 
                width: double.infinity,
                child: _ExamResultVideoPlayer(assetPath: videoAssetPath),
                ),
            ],
          ),
        ),
        if (incorrectAnswers.isNotEmpty) ...[
          const SizedBox(height: 20),
          Text(
            appLocalizations.incorrectAnswers,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ...incorrectAnswers.map((data) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${appLocalizations.questionLabel} ${data['question']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${appLocalizations.correctAnswerLabel} ${data['correctAnswer']}',
                      style: const TextStyle(color: Colors.green),
                    ),
                    Text(
                      '${appLocalizations.yourAnswerLabel} ${data['userAnswer'] ?? appLocalizations.notAnswered}',
                      style: TextStyle(
                        color:
                            data['userAnswer'] == data['correctAnswer']
                                ? Colors.green
                                : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: onResetExam,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            appLocalizations.backToHome,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}

class _ExamResultVideoPlayer extends StatefulWidget {
  final String assetPath;
  const _ExamResultVideoPlayer({super.key, required this.assetPath});

  @override
  State<_ExamResultVideoPlayer> createState() => _ExamResultVideoPlayerState();
}

class _ExamResultVideoPlayerState extends State<_ExamResultVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }
}
