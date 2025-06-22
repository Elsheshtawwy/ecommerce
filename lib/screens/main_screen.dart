import 'package:flutter/material.dart';
import 'package:ecommerce/models/question.dart';
import 'package:ecommerce/widgets/chapter_selection_widget.dart';
import 'package:ecommerce/widgets/exam_screen_widget.dart';
import 'package:ecommerce/widgets/exam_results_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ecommerce/main.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> _galleryImages = [
    'assets/images/photo_1.jpg',
    'assets/images/photo_2.jpg',
    'assets/images/photo_3.jpg',
    'assets/images/photo_4.jpg',
    'assets/images/photo_5.jpg',
    'assets/images/photo_6.jpg',
    'assets/images/photo_7.jpg',
    'assets/images/photo_8.jpg',
    'assets/images/photo_9.jpg',
    'assets/images/photo_10.jpg',
    'assets/images/photo_11.jpg',
    'assets/images/photo_12.jpg',
  ];

  String _selectedChapterTitle = '';
  String _selectedChapterKey = 'ch1';

  int _currentQuestionIndex = 0;
  List<String?> _userAnswers = [];
  int _selectedTFCount = 1;
  int _selectedMCCount = 1;
  List<Question> _selectedQuestions = [];
  bool _showExam = false;
  bool _examSubmitted = false;

  final Map<String, List<String>> _chapterLinks = {
    'ch1': ['./ch1-1.html', './ch1-2.html', './ch1-3.html', './ch1-4.html'],
    'ch2': ['./ch2-1.html', './ch2-2.html', './ch2-3.html', './ch2-4.html'],
    'ch3': ['./ch3-1.html', './ch3-2.html', './ch3-3.html', './ch3-4.html'],
    'ch4': ['./ch4-1.html', './ch4-2.html', './ch4-3.html', './ch4-4.html'],
    'ch5': ['./ch5-1.html', './ch5-2.html', './ch5-3.html', './ch5-4.html'],
    'ch6': ['./ch6-1.html', './ch6-2.html', './ch6-3.html', './ch6-4.html'],
    'ch7': ['./ch7-1.html', './ch7-2.html', './ch7-3.html', './ch7-4.html'],
  };

  @override
  void initState() {
    super.initState();
    _initializeCounts(_selectedChapterKey);
  }

  void _initializeCounts(String chapterKey) {
    final String currentLangCode = localeNotifier.locale?.languageCode ?? 'en';
    final List<Question> currentChapterQuestions =
        ExamQuestions.getChapterQuestions(chapterKey, currentLangCode);
    setState(() {
      _selectedTFCount =
          currentChapterQuestions.where((q) => q.type == 'tf').length;
      _selectedMCCount =
          currentChapterQuestions.where((q) => q.type == 'mc').length;
    });
  }

  void _onChapterSelected(String chapterKey, String chapterTitle) {
    setState(() {
      _selectedChapterTitle = chapterTitle;
      _selectedChapterKey = chapterKey;
      _showExam = true;
      _examSubmitted = false;
      _currentQuestionIndex = 0;
      _userAnswers = [];
      final String currentLangCode =
          localeNotifier.locale?.languageCode ?? 'en';
      final List<Question> availableQuestionsForChapter =
          ExamQuestions.getChapterQuestions(chapterKey, currentLangCode);
      _selectedTFCount =
          availableQuestionsForChapter.where((q) => q.type == 'tf').length;
      _selectedMCCount =
          availableQuestionsForChapter.where((q) => q.type == 'mc').length;
    });
  }

  void _startExamActual() {
    setState(() {
      final String currentLangCode =
          localeNotifier.locale?.languageCode ?? 'en';
      List<Question> availableQuestionsForChapter =
          ExamQuestions.getChapterQuestions(
            _selectedChapterKey,
            currentLangCode,
          );

      List<Question> tfQuestions =
          availableQuestionsForChapter.where((q) => q.type == 'tf').toList()
            ..shuffle();
      List<Question> mcQuestions =
          availableQuestionsForChapter.where((q) => q.type == 'mc').toList()
            ..shuffle();

      _selectedQuestions = [
        ...tfQuestions.take(_selectedTFCount),
        ...mcQuestions.take(_selectedMCCount),
      ];
      _userAnswers = List<String?>.filled(_selectedQuestions.length, null);
    });
  }

  void _goToPrevQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  void _goToNextQuestion() {
    if (_currentQuestionIndex < _selectedQuestions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _submitExam();
    }
  }

  void _saveAnswer(String? answer) {
    setState(() {
      if (_currentQuestionIndex < _userAnswers.length) {
        _userAnswers[_currentQuestionIndex] = answer;
      }
    });
  }

  void _submitExam() {
    setState(() {
      _examSubmitted = true;
      _showExam = false;
    });
  }

  void _resetExam() {
    setState(() {
      _showExam = false;
      _examSubmitted = false;
      _currentQuestionIndex = 0;
      _userAnswers = [];
      _selectedQuestions = [];
      _selectedChapterTitle = '';
      _selectedChapterKey = 'ch1';
      _initializeCounts(_selectedChapterKey);
    });
  }

  void _showImageGallery() {
    final PageController pageController = PageController();
    int currentIndex = 0;
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.75,
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          PageView.builder(
                            controller: pageController,
                            itemCount: _galleryImages.length,
                            onPageChanged: (index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: InteractiveViewer(
                                  minScale: 1,
                                  maxScale: 4,
                                  child: Image.asset(
                                    _galleryImages[index],
                                    fit: BoxFit.contain,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            left: 8,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_ios, size: 32),
                              onPressed:
                                  currentIndex > 0
                                      ? () {
                                        pageController.previousPage(
                                          duration: const Duration(
                                            milliseconds: 300,
                                          ),
                                          curve: Curves.ease,
                                        );
                                      }
                                      : null,
                            ),
                          ),
                          Positioned(
                            right: 8,
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                size: 32,
                              ),
                              onPressed:
                                  currentIndex < _galleryImages.length - 1
                                      ? () {
                                        pageController.nextPage(
                                          duration: const Duration(
                                            milliseconds: 300,
                                          ),
                                          curve: Curves.ease,
                                        );
                                      }
                                      : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        '${currentIndex + 1} / ${_galleryImages.length}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        'إغلاق',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.teal[800],
          elevation: 8.0,
          shadowColor: Colors.black.withOpacity(0.2),
          title: Text(
            appLocalizations.appTitle,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal[700]!, Colors.teal[900]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButton<Locale>(
                value: localeNotifier.locale ?? const Locale('en'),
                icon: const Icon(Icons.language, color: Colors.white),
                underline: const SizedBox.shrink(),
                onChanged: (Locale? newLocale) {
                  if (newLocale != null) {
                    localeNotifier.setLocale(newLocale);
                    _resetExam();
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: Locale('en'),
                    child: Text(
                      'English',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DropdownMenuItem(
                    value: Locale('ar'),
                    child: Text(
                      'العربية',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [const Color(0xFFE0F7FA), const Color(0xFFB2EBF2)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 120.0, bottom: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeOut,
                  width: screenWidth * 0.9,
                  constraints: const BoxConstraints(maxWidth: 700),
                  padding: const EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: _buildContent(appLocalizations),
                ),
                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: _showImageGallery,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    appLocalizations.showPreviousExams,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 30),

                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () async {
                      const url = 'https://t.me/BadrElsheshtawy';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(
                          Uri.parse(url),
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      padding: const EdgeInsets.symmetric(
                        vertical: 18.0,
                        horizontal: 22.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal.withOpacity(0.10),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.teal.shade100,
                          width: 1.2,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.teal[100],
                            child: const Icon(
                              Icons.developer_mode,
                              color: Colors.teal,
                              size: 24,
                            ),
                            radius: 20,
                          ),
                          const SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Developed by",
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(
                                  color: Colors.teal[800],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Badr Elsheshtawy',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyLarge?.copyWith(
                                  color: Colors.teal[900],
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.open_in_new,
                            color: Colors.teal[400],
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(AppLocalizations appLocalizations) {
    final String currentLangCode = localeNotifier.locale?.languageCode ?? 'en';

    if (_showExam) {
      return ExamScreenWidget(
        selectedChapterKey: _selectedChapterKey,
        selectedQuestions: _selectedQuestions,
        currentQuestionIndex: _currentQuestionIndex,
        userAnswers: _userAnswers,
        onAnswerSelected: _saveAnswer,
        goToPrevQuestion: _goToPrevQuestion,
        goToNextQuestion: _goToNextQuestion,
        startExam: _startExamActual,
        selectedTFCount: _selectedTFCount,
        selectedMCCount: _selectedMCCount,
        allQuestions: ExamQuestions.getChapterQuestions(
          _selectedChapterKey,
          currentLangCode,
        ),
        onTFCountChanged: (value) => setState(() => _selectedTFCount = value),
        onMCCountChanged: (value) => setState(() => _selectedMCCount = value),
        appLocalizations: appLocalizations,
      );
    } else if (_examSubmitted) {
      return ExamResultsWidget(
        selectedQuestions: _selectedQuestions,
        userAnswers: _userAnswers,
        onResetExam: _resetExam,
        appLocalizations: appLocalizations,
      );
    } else {
      return ChapterSelectionWidget(
        onChapterSelected: _onChapterSelected,
        selectedChapterTitle: _selectedChapterTitle,
        chapterLinks: _chapterLinks,
        appLocalizations: appLocalizations,
        availableChapterKeys: ExamQuestions.getAvailableChapterKeysForLocale(
          currentLangCode,
        ),
      );
    }
  }
}
