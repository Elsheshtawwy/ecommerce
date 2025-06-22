class Question {
  final String type;

  final String question;

  final List<String>? options;

  final String answer;

  Question({
    required this.type,
    required this.question,
    this.options,
    required this.answer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      type: json['type'] as String,
      question: json['question'] as String,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      answer: json['answer'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'question': question,
      'options': options,
      'answer': answer,
    };
  }
}

class ExamQuestions {
  static final Map<String, List<Question>> arabicChapterQuestions = {
"ch3" : [
  // أسئلة صح/خطأ
  Question(
    type: 'tf',
    question: 'يجب الإجابة عن أسئلة الرؤية قبل بناء موقع التجارة الإلكترونية.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'تتضمن عملية الرؤية تحديد الجمهور المستهدف فقط.',
    answer: 'F',
  ),
  Question(
    type: 'tf',
    question: 'SWOT تحليل يقيم نقاط القوة والضعف والفرص والتهديدات.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'المحتوى الديناميكي لا يتغير بانتظام.',
    answer: 'F',
  ),
  Question(
    type: 'tf',
    question: 'المحتوى الثابت يتغير يوميًا أو بانتظام.',
    answer: 'F',
  ),
  Question(
    type: 'tf',
    question: 'المحتوى الثابت هو نص وصور لا تتغير كثيرًا.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'تحليل السوق يشمل تمييز إذا كان السوق متناميًا أم متراجعًا.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'خريطة الشركة تحدد نقاط التفاعل مع العملاء عبر الأجهزة المختلفة.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'الجدول الزمني المكون من ست مراحل كافٍ في البداية.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'تكلفة الموقع لا تعتمد على وظائفه.',
    answer: 'F',
  ),
  Question(
    type: 'tf',
    question: 'SDLC لبناء موقع التجارة الإلكترونية تتضمن خمس خطوات.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'الخطوة الأولى في SDLC هي بناء الموقع.',
    answer: 'F',
  ),
  Question(
    type: 'tf',
    question: 'الاختبار المتعدد المتغيرات هو نوع من اختبارات النظام.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'تطوير الخدمات المصغرة (microservices) هو مثال على SOA.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'Agile development ليس من منهجيات تطوير الويب المذكورة.',
    answer: 'F',
  ),
  Question(
    type: 'tf',
    question: 'قاعدة بيانات المنتجات جزء من وظائف النظام الأساسية.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'سيرفر الإعلانات ليس ضروريًا لأي موقع تجارة إلكترونية.',
    answer: 'F',
  ),
  Question(
    type: 'tf',
    question: 'مدونة داخل الموقع يمكن أن تكون وظيفة أساسية.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'يجب تجاهل قدرة الاتصالات عند التخطيط للبنية التحتية.',
    answer: 'F',
  ),
  Question(
    type: 'tf',
    question: 'تتضمن المرحلة النهائية من عملية البناء صيانة الموقع.',
    answer: 'T',
  ),

  // أسئلة اختيار من متعدد
  Question(
    type: 'mc',
    question: 'ما الخطوة الأولى في عملية بناء الموقع وفقًا للمنهج؟',
    options: [
      'A) تحديد الأهداف والمتطلبات',
      'B) تطوير مواصفات التصميم',
      'C) بناء الموقع',
      'D) اختبار النظام'
    ],
    answer: 'A) تحديد الأهداف والمتطلبات',
  ),
  Question(
    type: 'mc',
    question: 'ما الذي يحدد نموذج الإيرادات؟',
    options: [
      'A) عملية الرؤية',
      'B) نموذج العمل والإيرادات',
      'C) تحليل SWOT',
      'D) الجدول الزمني'
    ],
    answer: 'B) نموذج العمل والإيرادات',
  ),
  Question(
    type: 'mc',
    question: 'أي من التالي ليس جزءًا من عملية الرؤية؟',
    options: [
      'A) تحليل SWOT',
      'B) تحديد الجمهور المستهدف',
      'C) تطوير الجدول الزمني',
      'D) اختبار القبول'
    ],
    answer: 'D) اختبار القبول',
  ),
  Question(
    type: 'mc',
    question: 'ما الذي يمثله SWOT؟',
    options: [
      'A) نقاط القوة والضعف والفرص والتهديدات',
      'B) سوق ضعيف وتنمية وفرص تحديد',
      'C) نظام اختبارات وتقييم',
      'D) نموذج الإيرادات'
    ],
    answer: 'A) نقاط القوة والضعف والفرص والتهديدات',
  ),
  Question(
    type: 'mc',
    question: 'ما نوع المحتوى الذي يتغير بانتظام؟',
    options: [
      'A) ثابت',
      'B) ديناميكي',
      'C) محتوى الرؤية',
      'D) الجدول الزمني'
    ],
    answer: 'B) ديناميكي',
  ),
  Question(
    type: 'mc',
    question: 'أي من التالي يُنشئه المدونون والمستخدمون؟',
    options: [
      'A) محتوى ثابت',
      'B) محتوى ديناميكي',
      'C) تحليل SWOT',
      'D) مواصفات التصميم'
    ],
    answer: 'B) محتوى ديناميكي',
  ),
  Question(
    type: 'mc',
    question: 'أي مما يلي لا يعد محتوى ثابت؟',
    options: [
      'A) وصف المنتج',
      'B) صور المنتجات',
      'C) تحديث المدونة اليومي',
      'D) نص لا يتغير'
    ],
    answer: 'C) تحديث المدونة اليومي',
  ),
  Question(
    type: 'mc',
    question: 'ما الذي يصف خريطة الشركة؟',
    options: [
      'A) مراحل التطوير',
      'B) نقاط التفاعل مع العملاء',
      'C) تحليل التهديدات',
      'D) نموذج الإيرادات'
    ],
    answer: 'B) نقاط التفاعل مع العملاء',
  ),
  Question(
    type: 'mc',
    question: 'لماذا نحتاج إلى تحليل السوق؟',
    options: [
      'A) لتحديد نمو السوق',
      'B) لا أهمية له',
      'C) للحصول على شهادة',
      'D) لتطوير المحتوى'
    ],
    answer: 'A) لتحديد نمو السوق',
  ),
  Question(
    type: 'mc',
    question: 'أي خطوة في SDLC تشمل الاختبار المتعدد المتغيرات؟',
    options: [
      'A) تحديد المتطلبات',
      'B) مواصفات التصميم',
      'C) بناء الموقع',
      'D) اختبار النظام'
    ],
    answer: 'D) اختبار النظام',
  ),
  Question(
    type: 'mc',
    question: 'أي منهجية تُستخدم لبناء نموذج أولي من الموقع؟',
    options: [
      'A) Prototyping',
      'B) Component-based',
      'C) SOA',
      'D) SWOT'
    ],
    answer: 'A) Prototyping',
  ),
  Question(
    type: 'mc',
    question: 'ما معنى SOA؟',
    options: [
      'A) Service-Oriented Architecture',
      'B) Static-Oriented Analysis',
      'C) System Organizational Approach',
      'D) Strategic Online Automation'
    ],
    answer: 'A) Service-Oriented Architecture',
  ),
  Question(
    type: 'mc',
    question: 'أي من التالي يعد وظيفة أساسية للنظام؟',
    options: [
      'A) Digital catalog',
      'B) Email client',
      'C) Video hosting',
      'D) Analytics only'
    ],
    answer: 'A) Digital catalog',
  ),
  Question(
    type: 'mc',
    question: 'ما النظام الذي يحتفظ ببيانات العملاء والتفاعلات؟',
    options: [
      'A) CRM system',
      'B) Data warehouse',
      'C) Ad server',
      'D) Shopping cart'
    ],
    answer: 'A) CRM system',
  ),
  Question(
    type: 'mc',
    question: 'ما سبب استخدام الجدول الزمني مع مراحل؟',
    options: [
      'A) لتقسيم المشروع إلى أجزاء',
      'B) لتحليل SWOT',
      'C) لتحديد الجمهور',
      'D) لتطوير المحتوى'
    ],
    answer: 'A) لتقسيم المشروع إلى أجزاء',
  ),
  Question(
    type: 'mc',
    question: 'أي أداة تقنية تضمن إدارة المخزون؟',
    options: [
      'A) Inventory management system',
      'B) Digital catalog',
      'C) Ad server',
      'D) Shopping cart'
    ],
    answer: 'A) Inventory management system',
  ),
  Question(
    type: 'mc',
    question: 'ما الخطوة الأخيرة في SDLC؟',
    options: [
      'A) Implement and maintain',
      'B) Unit testing',
      'C) Develop design spec',
      'D) Identify requirements'
    ],
    answer: 'A) Implement and maintain',
  ),
  Question(
    type: 'mc',
    question: 'ما الذي يصف نموذج الأعمال؟',
    options: [
      'A) مخطط الإيرادات والتكاليف',
      'B) الجدول الزمني',
      'C) تحليل SWOT',
      'D) نظام الاختبار'
    ],
    answer: 'A) مخطط الإيرادات والتكاليف',
  ),
  Question(
    type: 'mc',
    question: 'أي مما يلي ليس منهجية تطوير ويب مذكورة؟',
    options: [
      'A) Waterfall',
      'B) Agile development',
      'C) Prototyping',
      'D) Component-based'
    ],
    answer: 'A) Waterfall',
  ),
  Question(
    type: 'mc',
    question: 'أي من الوظائف الأساسية يتعامل مع تتبع المواقع والتقارير؟',
    options: [
      'A) Site tracking and reporting system',
      'B) Product database',
      'C) CRM system',
      'D) Ad server'
    ],
    answer: 'A) Site tracking and reporting system',
  ),
],
    "ch4": [
      // أسئلة صح/خطأ
      Question(
        type: 'tf',
        question:
            'الإنترنت يوفر سوقًا عالميًا ضخمًا ومريحًا للمواطنين الملتزمين بالقانون.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'المجرمين لا يمكنهم الاستفادة من الإنترنت لسرقة المستهلكين عبر العالم.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'Integrity هي القدرة على ضمان عدم تعديل المعلومات المرسلة عبر الإنترنت من قبل طرف غير مصرح له.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Nonrepudiation هي القدرة على السماح للمشاركين بإنكار أفعالهم على الإنترنت.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'Authenticity هي القدرة على تحديد هوية الشخص أو الكيان الذي تتعامل معه على الإنترنت.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Confidentiality هي القدرة على ضمان أن الرسائل والبيانات متاحة فقط للمصرح لهم بعرضها.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Privacy هي القدرة على منع المستخدمين من السيطرة على استخدام معلوماتهم الشخصية.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'Availability هي القدرة على ضمان استمرار موقع التجارة الإلكترونية في العمل كما هو مقصود.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'زيادة التدابير الأمنية دائمًا تجعل موقع التجارة الإلكترونية أسهل في الاستخدام.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question: 'يؤدي الأمن الزائد إلى إبطاء الموقع وتقليل سهولة الاستخدام.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question: 'TSL لا تقوم بمصادقة التاجر أو المستهلك.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'تبدأ معاملة بطاقة الائتمان على الإنترنت بإضافة المستهلك للعنصر إلى عربة التسوق.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'يستخدم التاجر نفقًا آمنًا باستخدام TLS لتأمين جلسة إرسال معلومات البطاقة.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question: 'يتصل Clearinghouse بالبنك المصدر للتحقق من معلومات الحساب.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Blockchain يوفر نظام معالجة معاملات يعمل على قاعدة بيانات مركزية.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'Cryptocurrency هي أصول رقمية تستخدم تقنية البلوكشين والتشفير.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question: 'Bitcoin هو أكثر مثال شهرة للعملات المشفرة المستخدمة اليوم.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question: 'PayPal هو أشهر طريقة دفع بديلة عبر الإنترنت.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'الدفع عبر بطاقات الخصم والائتمان ليس هو الشكل السائد للدفع عبر الإنترنت.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'ارتفع تبني البيع بالتجزئة عبر الهاتف المحمول وحجم الدفع خلال جائحة كوفيد-19.',
        answer: 'T',
      ),

      // أسئلة اختيار من متعدد
      Question(
        type: 'mc',
        question: 'أي من الأبعاد التالية يشير إلى ضمان عدم تعديل المعلومات؟',
        options: [
          'A) Integrity',
          'B) Confidentiality',
          'C) Availability',
          'D) Privacy',
        ],
        answer: 'A) Integrity',
      ),
      Question(
        type: 'mc',
        question:
            'أي من الأبعاد التالية يشير إلى عدم قدرة المشاركين على إنكار أفعالهم على الإنترنت؟',
        options: [
          'A) Authenticity',
          'B) Privacy',
          'C) Nonrepudiation',
          'D) Availability',
        ],
        answer: 'C) Nonrepudiation',
      ),
      Question(
        type: 'mc',
        question:
            'أي نظام من أنظمة الدفع عبر الإنترنت يعتمد على المخزن القيمي؟',
        options: ['A) PayPal', 'B) Venmo', 'C) Apple Pay', 'D) Zelle'],
        answer: 'A) PayPal',
      ),
      Question(
        type: 'mc',
        question: 'أي من التطبيقات التالية ليس تطبيق دفع P2P؟',
        options: ['A) Venmo', 'B) Zelle', 'C) Square Cash', 'D) Google Pay'],
        answer: 'D) Google Pay',
      ),
      Question(
        type: 'mc',
        question: 'أي طرف مسؤول عن مصادقة البطاقات والتحقق من الأرصدة؟',
        options: [
          'A) Merchant',
          'B) Issuing Bank',
          'C) Clearinghouse',
          'D) Consumer',
        ],
        answer: 'C) Clearinghouse',
      ),
      Question(
        type: 'mc',
        question:
            'أي تقنية تُستخدم لإنشاء نفق آمن عند إرسال معلومات البطاقة الائتمانية؟',
        options: ['A) QR Code', 'B) NFC', 'C) TLS', 'D) Blockchain'],
        answer: 'C) TLS',
      ),
      Question(
        type: 'mc',
        question: 'أي من التالي ليس من أبعاد أمان التجارة الإلكترونية؟',
        options: [
          'A) Integrity',
          'B) Scalability',
          'C) Confidentiality',
          'D) Availability',
        ],
        answer: 'B) Scalability',
      ),
      Question(
        type: 'mc',
        question:
            'أي من التالي يعد أحد الجوانب التي يوجد فيها توتر بين الأمان وعمليات الموقع؟',
        options: [
          'A) Ease of Use',
          'B) Confidentiality',
          'C) Blockchain',
          'D) NFC',
        ],
        answer: 'A) Ease of Use',
      ),
      Question(
        type: 'mc',
        question:
            'أي بعد يشير إلى القدرة على التحكم في استخدام المعلومات الشخصية؟',
        options: [
          'A) Privacy',
          'B) Availability',
          'C) Integrity',
          'D) Authenticity',
        ],
        answer: 'A) Privacy',
      ),
      Question(
        type: 'mc',
        question:
            'أي من التالي كان اتجاهًا رئيسيًا في دفعات التجارة الإلكترونية 2020–2021؟',
        options: [
          'A) تراجع استخدام بطاقات الائتمان',
          'B) PayPal أصبح أقل شيوعًا',
          'C) ارتفاع تبني الدفع عبر الهاتف المحمول',
          'D) انخفاض حجم المدفوعات عبر الإنترنت',
        ],
        answer: 'C) ارتفاع تبني الدفع عبر الهاتف المحمول',
      ),
      Question(
        type: 'mc',
        question:
            'أي شركة قدمت بطاقة ائتمان ودخلت سوق المحفظة الرقمية خلال تلك الفترة؟',
        options: ['A) Google', 'B) Apple', 'C) Samsung', 'D) PayPal'],
        answer: 'B) Apple',
      ),
      Question(
        type: 'mc',
        question:
            'أي من التالي يُعد محفظة متنقلة شاملة يمكن استخدامها في عدة تجار؟',
        options: ['A) Walmart', 'B) Tesco', 'C) Starbucks', 'D) Apple Pay'],
        answer: 'D) Apple Pay',
      ),
      Question(
        type: 'mc',
        question:
            'ما هي تقنية الاتصالات قصيرة المدى المستخدمة لمشاركة المعلومات بين الأجهزة؟',
        options: ['A) NFC', 'B) QR Code', 'C) TLS', 'D) Blockchain'],
        answer: 'A) NFC',
      ),
      Question(
        type: 'mc',
        question: 'أي من التالي يستخدم رمز QR لتمكين الدفع؟',
        options: ['A) NFC', 'B) QR Code', 'C) TLS', 'D) Blockchain'],
        answer: 'B) QR Code',
      ),
      Question(
        type: 'mc',
        question:
            'أي مما يلي ليس أحد الأطراف الخمسة في معاملة بطاقة الائتمان عبر الإنترنت؟',
        options: [
          'A) Consumer',
          'B) Merchant Bank',
          'C) Clearinghouse',
          'D) Government',
        ],
        answer: 'D) Government',
      ),
      Question(
        type: 'mc',
        question:
            'ما هو الحساب المطلوب للتاجر لقبول مدفوعات بطاقة الائتمان عبر الإنترنت؟',
        options: [
          'A) Checking Account',
          'B) Merchant Account',
          'C) Savings Account',
          'D) Stored Value Account',
        ],
        answer: 'B) Merchant Account',
      ),
      Question(
        type: 'mc',
        question: 'أي مما يلي ليس آلية دفع تقليدية مذكورة؟',
        options: [
          'A) Cash',
          'B) Credit Cards',
          'C) Cryptocurrency',
          'D) Checking Accounts',
        ],
        answer: 'C) Cryptocurrency',
      ),
      Question(
        type: 'mc',
        question: 'أي تقنية تتيح إجراء معاملات دون سلطة مركزية؟',
        options: ['A) Blockchain', 'B) TLS', 'C) NFC', 'D) QR Code'],
        answer: 'A) Blockchain',
      ),
      Question(
        type: 'mc',
        question: 'أي هو المثال الأبرز للعملات المشفرة المستخدمة اليوم؟',
        options: ['A) PayPal', 'B) Bitcoin', 'C) Apple Pay', 'D) Zelle'],
        answer: 'B) Bitcoin',
      ),
      Question(
        type: 'mc',
        question: 'أي طرف يقوم بإيداع الأموال في حساب التاجر؟',
        options: [
          'A) Issuing Bank',
          'B) Consumer',
          'C) Merchant',
          'D) Clearinghouse',
        ],
        answer: 'A) Issuing Bank',
      ),
    ],
    "ch5": [
      // أسئلة صح/خطأ
      Question(
        type: 'tf',
        question:
            'يمكن أن يكون التسويق الإلكتروني أكثر تخصيصًا من التسويق التقليدي.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'جميع أنواع التسويق الإلكتروني تتمتع بميزات التخصيص والمشاركة ونظير إلى نظير والمجتمعية.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'هدف التسويق الإلكتروني هو بناء علاقات مع العملاء لتحقيق عوائد فوق المتوسط.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'التسويق عبر محركات البحث يستخدم الإعلانات العرضية لجذب المستهلكين.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'الانضمام المدفوع يضمن إدراج الموقع في قائمة محرك البحث مقابل رسوم.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'الإدراج العضوي في البحث يعتمد على عملية مزايدة على الكلمات المفتاحية.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'إعلانات الدفع بالنقرة تعد النوع الأساسي من إعلانات محرك البحث.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'إعلانات الكلمات المفتاحية تتطلب شراء الكلمات عبر عملية مزايدة.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'الإعلانات القائمة على الكلمات المفتاحية الشبكية تدفع للمعلنين لقاء ظهور الإعلانات فقط.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'الإعلانات البانرية تعرض رسالة ترويجية في صندوق مستطيل أعلى أو أسفل الشاشة.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question: 'الإعلانات ذات الوسائط الغنية لا تتضمن ميزات تفاعلية.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'الإعلانات الفيديو تشبه إعلانات التلفاز وتظهر كفيديو داخل الصفحة قبل المحتوى أو بعده.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'الرعاية تربط اسم المعلن بحدث أو مكان بطريقة غير تجارية تمامًا.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'التسويق عبر البريد الإلكتروني يُرسل فقط إلى جمهور اختار الاشتراك.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'الرسائل العشوائية (Spam) هي رسائل تجارية موجهة لجمهور اختار الاشتراك.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'التسويق بالعمولة يدفع عمولة فقط إذا نقر المستخدم على الرابط أو اشترى المنتج.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question: 'التسويق الفيروسي يعتمد على دفع عمولة للمواقع المشتركة.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'التسويق الاجتماعي يستخدم الشبكات والمجتمعات الإلكترونية لبناء العلامات التجارية.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question: 'سجلات المعاملات على الويب لا تسجل نشاط المستخدم في الموقع.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'ملفات تعريف الارتباط (Cookies) هي ملفات نصية صغيرة تُوضع على القرص الصلب للزائر.',
        answer: 'T',
      ),

      // أسئلة اختيار من متعدد
      Question(
        type: 'mc',
        question:
            'أي مما يلي ليس أحد أدوات التسويق والإعلان التقليدية عبر الإنترنت؟',
        options: [
          'A) التسويق عبر محركات البحث',
          'B) التسويق الفيروسي',
          'C) التسويق الآلي',
          'D) التسويق بالبريد الإلكتروني',
        ],
        answer: 'C) التسويق الآلي',
      ),
      Question(
        type: 'mc',
        question:
            'أي نوع من الإعلانات يضمن إدراج الموقع في قائمة البحث مقابل رسوم؟',
        options: [
          'A) الانضمام المدفوع',
          'B) الإدراج العضوي',
          'C) الدفع بالنقرة',
          'D) الكلمات المفتاحية الشبكية',
        ],
        answer: 'A) الانضمام المدفوع',
      ),
      Question(
        type: 'mc',
        question: 'ما المصطلح الذي يُعرف بعملية عرض إعلانات الدفع بالنقرة؟',
        options: ['A) SEM', 'B) PPC', 'C) SEO', 'D) CRM'],
        answer: 'B) PPC',
      ),
      Question(
        type: 'mc',
        question: 'أي مما يلي هو نوع من إعلانات الوسائط الغنية؟',
        options: [
          'A) بانر',
          'B) فيديو داخلي',
          'C) إعلان تفاعلي',
          'D) إعلان نصي',
        ],
        answer: 'C) إعلان تفاعلي',
      ),
      Question(
        type: 'mc',
        question:
            'ما اسم الأداة التي تسجل نشاط المستخدم في موقع التجارة الإلكترونية؟',
        options: [
          'A) ملفات تعريف الارتباط',
          'B) سجل المعاملات على الويب',
          'C) قاعدة بيانات سلة التسوق',
          'D) نظام إدارة علاقات العملاء',
        ],
        answer: 'B) سجل المعاملات على الويب',
      ),
      Question(
        type: 'mc',
        question: 'أي مما يلي ليس أحد أنواع ملفات التتبع؟',
        options: [
          'A) Cookies',
          'B) Flash cookies',
          'C) Web beacons',
          'D) سلة التسوق',
        ],
        answer: 'D) سلة التسوق',
      ),
      Question(
        type: 'mc',
        question: 'ما وظيفة مستودع البيانات (Data Warehouse)؟',
        options: [
          'A) إدارة علاقات العملاء',
          'B) جمع البيانات التحليلية في موقع واحد',
          'C) إرسال رسائل بريد إلكتروني',
          'D) عرض الإعلانات',
        ],
        answer: 'B) جمع البيانات التحليلية في موقع واحد',
      ),
      Question(
        type: 'mc',
        question: 'ما المقصود بالتنقيب عن البيانات (Data Mining)؟',
        options: [
          'A) تحليل نمط البيانات',
          'B) إنشاء سجلات المعاملات',
          'C) تصميم الإعلانات',
          'D) إدارة سلة التسوق',
        ],
        answer: 'A) تحليل نمط البيانات',
      ),
      Question(
        type: 'mc',
        question:
            'أي مصطلح يشير إلى البيانات الرقمية الضخمة التي لا يمكن لإدارة قواعد البيانات التقليدية التعامل معها؟',
        options: ['A) CRM', 'B) SEM', 'C) Big Data', 'D) PPC'],
        answer: 'C) Big Data',
      ),
      Question(
        type: 'mc',
        question: 'ما هدف أنظمة أتمتة التسويق؟',
        options: [
          'A) تتبع خطوات توليد العملاء المحتملين',
          'B) إدارة سلة التسوق',
          'C) تحليل ملفات تعريف الارتباط',
          'D) عرض الإعلانات الفيديو',
        ],
        answer: 'A) تتبع خطوات توليد العملاء المحتملين',
      ),
      Question(
        type: 'mc',
        question: 'ما هي وظيفة نظام إدارة علاقات العملاء (CRM)؟',
        options: [
          'A) إرسال الإعلانات عبر محركات البحث',
          'B) تخزين معلومات اتصالات العملاء',
          'C) إنشاء بيانات التعريف',
          'D) إدارة ملفات تعريف الارتباط',
        ],
        answer: 'B) تخزين معلومات اتصالات العملاء',
      ),
      Question(
        type: 'mc',
        question: 'ما المعلومات التي تجمعها نماذج التسجيل؟',
        options: [
          'A) اسم وعنوان وبريد إلكتروني',
          'B) بيانات الدفع',
          'C) تفضيلات العرض',
          'D) ملفات التتبع',
        ],
        answer: 'A) اسم وعنوان وبريد إلكتروني',
      ),
      Question(
        type: 'mc',
        question: 'ما البيانات التي تلتقطها قاعدة بيانات سلة التسوق؟',
        options: [
          'A) بيانات اختيار العناصر والشراء والدفع',
          'B) بيانات ملفات التعريف',
          'C) ملفات تعريف الارتباط',
          'D) نتائج البحث العضوي',
        ],
        answer: 'A) بيانات اختيار العناصر والشراء والدفع',
      ),
      Question(
        type: 'mc',
        question: 'أي مما يلي يعد مثالًا على التسويق الفيروسي؟',
        options: [
          'A) إعلان بانر',
          'B) مشاركة رسالة عبر الأصدقاء',
          'C) مزايدة كلمات مفتاحية',
          'D) سجل المعاملات',
        ],
        answer: 'B) مشاركة رسالة عبر الأصدقاء',
      ),
      Question(
        type: 'mc',
        question:
            'أي من التالي يُعتبر أداة مالية مستخدمة في التسويق بالبريد الإلكتروني؟',
        options: [
          'A) Opt-in audience',
          'B) Spam',
          'C) Banner ad',
          'D) Flash cookie',
        ],
        answer: 'A) Opt-in audience',
      ),
      Question(
        type: 'mc',
        question: 'ما الفرق بين Spam وOpt-in audience؟',
        options: [
          'A) Spam للجمهور غير المختار، Opt-in للجمهور المختار',
          'B) Spam للجمهور المختار، Opt-in للجمهور غير المختار',
          'C) كلاهما واحد',
          'D) لا علاقة',
        ],
        answer: 'A) Spam للجمهور غير المختار، Opt-in للجمهور المختار',
      ),
      Question(
        type: 'mc',
        question: 'أي مما يلي ليس من مهام أنظمة إدارة علاقات العملاء؟',
        options: [
          'A) تتبع تفاعلات العملاء',
          'B) إنشاء نماذج التسجيل',
          'C) توليد ملفات التعريف',
          'D) عرض الإعلانات',
        ],
        answer: 'D) عرض الإعلانات',
      ),
      Question(
        type: 'mc',
        question: 'أي من أدوات التسويق يستخدم المحتوى الذي ينشئه المستخدم؟',
        options: [
          'A) Viral Marketing',
          'B) SEM',
          'C) CRM',
          'D) Data Warehouse',
        ],
        answer: 'A) Viral Marketing',
      ),
    ],

  };

  static final Map<String, List<Question>> englishChapterQuestions = {
   
"ch3" : [
  // True/False questions
  Question(
    type: 'tf',
    question: 'You must answer the visioning questions before building an e-commerce site.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'The visioning process includes only identifying the target audience.',
    answer: 'F',
  ),
  Question(
    type: 'tf',
    question: 'A SWOT analysis evaluates strengths, weaknesses, opportunities, and threats.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'Dynamic content does not change regularly.',
    answer: 'F',
  ),
  Question(
    type: 'tf',
    question: 'Static content changes daily or regularly.',
    answer: 'F',
  ),
  Question(
    type: 'tf',
    question: 'Static content consists of text and images that do not change frequently.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'Characterizing the market involves determining whether it is growing or declining.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'An e-commerce company map identifies customer touch points across devices.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'A six-phase timeline is sufficient at the initial planning stage.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'The cost of a site does not depend on its functionalities.',
    answer: 'F',
  ),
  Question(
    type: 'tf',
    question: 'The SDLC for building an e-commerce site involves five major steps.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'The first SDLC step is to build the site.',
    answer: 'F',
  ),
  Question(
    type: 'tf',
    question: 'Multivariate testing is a type of system testing.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'Microservices development is an example of SOA.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'Agile development is not one of the mentioned web development methodologies.',
    answer: 'F',
  ),
  Question(
    type: 'tf',
    question: 'A product database is part of the basic system functionalities.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'An ad server is not necessary for any e-commerce site.',
    answer: 'F',
  ),
  Question(
    type: 'tf',
    question: 'An on-site blog can be considered a basic functionality.',
    answer: 'T',
  ),
  Question(
    type: 'tf',
    question: 'Telecommunications capacity can be ignored when planning infrastructure.',
    answer: 'F',
  ),
  Question(
    type: 'tf',
    question: 'The final phase of the build process includes maintaining the site.',
    answer: 'T',
  ),

  // Multiple choice questions
  Question(
    type: 'mc',
    question: 'What is the first step in the e-commerce SDLC?',
    options: [
      'A) Identify business objectives and requirements',
      'B) Develop design specifications',
      'C) Build the site',
      'D) Test the system'
    ],
    answer: 'A) Identify business objectives and requirements',
  ),
  Question(
    type: 'mc',
    question: 'What determines the revenue model?',
    options: [
      'A) Visioning process',
      'B) Business and revenue model',
      'C) SWOT analysis',
      'D) Timeline'
    ],
    answer: 'B) Business and revenue model',
  ),
  Question(
    type: 'mc',
    question: 'Which is NOT part of the visioning process?',
    options: [
      'A) SWOT analysis',
      'B) Defining target audience',
      'C) Developing a timeline',
      'D) Acceptance testing'
    ],
    answer: 'D) Acceptance testing',
  ),
  Question(
    type: 'mc',
    question: 'What does SWOT stand for?',
    options: [
      'A) Strengths, Weaknesses, Opportunities, Threats',
      'B) Systems, Workflows, Operations, Tactics',
      'C) Site, Web, Objectives, Testing',
      'D) Sales, Wages, Overheads, Turnover'
    ],
    answer: 'A) Strengths, Weaknesses, Opportunities, Threats',
  ),
  Question(
    type: 'mc',
    question: 'Which content type changes regularly?',
    options: [
      'A) Static content',
      'B) Dynamic content',
      'C) Vision content',
      'D) Timeline content'
    ],
    answer: 'B) Dynamic content',
  ),
  Question(
    type: 'mc',
    question: 'Which of the following is created by bloggers and fans?',
    options: [
      'A) Static content',
      'B) Dynamic content',
      'C) SWOT matrices',
      'D) Design specs'
    ],
    answer: 'B) Dynamic content',
  ),
  Question(
    type: 'mc',
    question: 'Which is NOT static content?',
    options: [
      'A) Product description',
      'B) Product photos',
      'C) Daily blog update',
      'D) Unchanging text'
    ],
    answer: 'C) Daily blog update',
  ),
  Question(
    type: 'mc',
    question: 'What does an e-commerce company map show?',
    options: [
      'A) Development phases',
      'B) Customer touch points',
      'C) Threat analysis',
      'D) Revenue streams'
    ],
    answer: 'B) Customer touch points',
  ),
  Question(
    type: 'mc',
    question: 'Why conduct a market characterization?',
    options: [
      'A) To assess market growth',
      'B) It has no value',
      'C) To obtain certification',
      'D) To develop content'
    ],
    answer: 'A) To assess market growth',
  ),
  Question(
    type: 'mc',
    question: 'Which SDLC step includes multivariate testing?',
    options: [
      'A) Identify requirements',
      'B) Design specifications',
      'C) Build',
      'D) Test'
    ],
    answer: 'D) Test',
  ),
  Question(
    type: 'mc',
    question: 'Which methodology is used for creating an early prototype?',
    options: [
      'A) Prototyping',
      'B) Component-based',
      'C) SOA',
      'D) SWOT'
    ],
    answer: 'A) Prototyping',
  ),
  Question(
    type: 'mc',
    question: 'What does SOA stand for?',
    options: [
      'A) Service-Oriented Architecture',
      'B) Static-Oriented Analysis',
      'C) System Organizational Approach',
      'D) Strategic Online Automation'
    ],
    answer: 'A) Service-Oriented Architecture',
  ),
  Question(
    type: 'mc',
    question: 'Which is a basic system functionality?',
    options: [
      'A) Digital catalog',
      'B) Email client',
      'C) Video hosting',
      'D) Analytics only'
    ],
    answer: 'A) Digital catalog',
  ),
  Question(
    type: 'mc',
    question: 'Which system stores customer contact records?',
    options: [
      'A) CRM system',
      'B) Data warehouse',
      'C) Ad server',
      'D) Shopping cart'
    ],
    answer: 'A) CRM system',
  ),
  Question(
    type: 'mc',
    question: 'Why use a phased timeline?',
    options: [
      'A) To break the project into parts',
      'B) For SWOT analysis',
      'C) To define audience',
      'D) To develop content'
    ],
    answer: 'A) To break the project into parts',
  ),
  Question(
    type: 'mc',
    question: 'Which tool ensures inventory control?',
    options: [
      'A) Inventory management system',
      'B) Digital catalog',
      'C) Ad server',
      'D) Shopping cart'
    ],
    answer: 'A) Inventory management system',
  ),
  Question(
    type: 'mc',
    question: 'What is the final SDLC phase?',
    options: [
      'A) Implement and maintain',
      'B) Unit testing',
      'C) Develop design specs',
      'D) Identify requirements'
    ],
    answer: 'A) Implement and maintain',
  ),
  Question(
    type: 'mc',
    question: 'Which describes a business model?',
    options: [
      'A) Revenue and cost framework',
      'B) Timeline',
      'C) SWOT matrix',
      'D) Testing plan'
    ],
    answer: 'A) Revenue and cost framework',
  ),
  Question(
    type: 'mc',
    question: 'Which is NOT a mentioned web methodology?',
    options: [
      'A) Waterfall',
      'B) Agile development',
      'C) Prototyping',
      'D) Component-based'
    ],
    answer: 'A) Waterfall',
  ),
  Question(
    type: 'mc',
    question: 'Which functionality handles site tracking and reporting?',
    options: [
      'A) Site tracking and reporting system',
      'B) Product database',
      'C) CRM system',
      'D) Ad server'
    ],
    answer: 'A) Site tracking and reporting system',
  ),
],
    "ch4": [
      // True/False questions
      Question(
        type: 'tf',
        question:
            'The Internet provides a huge and convenient global marketplace for law-abiding citizens.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Criminals cannot take advantage of the Internet to steal from consumers worldwide.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'Integrity is the ability to ensure that information displayed on a website has not been altered by an unauthorized party.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Nonrepudiation is the ability to allow e-commerce participants to repudiate their online actions.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'Authenticity is the ability to identify the identity of a person or entity with whom you are dealing on the Internet.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Confidentiality is the ability to ensure that messages and data are available only to those authorized to view them.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Privacy is the ability to prevent users from controlling the use of their personal information.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'Availability is the ability to ensure that an e-commerce site continues to function as intended.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Adding more security measures always makes an e-commerce site easier to use.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'Excessive security slows down the site and reduces ease of use.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question: 'TSL authenticates both the merchant and the consumer.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'An online credit card transaction begins when the consumer adds the item to the shopping cart.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'The merchant uses a secure tunnel using TLS to secure the session when sending card information.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'A clearinghouse contacts the issuing bank to verify account information.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Blockchain provides a transaction processing system that operates on a centralized database.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'Cryptocurrency are digital assets that work as a medium of exchange using blockchain technology and cryptography.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Bitcoin is the most prominent example of cryptocurrency in use today.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'PayPal remains the most popular alternative payment method online.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Payment by credit and debit cards is not the dominant form of online payment.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'Mobile retail adoption and mobile payment volume skyrocketed during the Covid-19 pandemic.',
        answer: 'T',
      ),

      // Multiple choice questions
      Question(
        type: 'mc',
        question:
            'Which dimension refers to ensuring that information has not been altered?',
        options: [
          'A) Integrity',
          'B) Confidentiality',
          'C) Availability',
          'D) Privacy',
        ],
        answer: 'A) Integrity',
      ),
      Question(
        type: 'mc',
        question:
            'Which dimension ensures e-commerce participants cannot deny their online actions?',
        options: [
          'A) Authenticity',
          'B) Privacy',
          'C) Nonrepudiation',
          'D) Availability',
        ],
        answer: 'C) Nonrepudiation',
      ),
      Question(
        type: 'mc',
        question: 'Which online payment system is based on stored value?',
        options: ['A) PayPal', 'B) Venmo', 'C) Apple Pay', 'D) Zelle'],
        answer: 'A) PayPal',
      ),
      Question(
        type: 'mc',
        question: 'Which of the following is NOT a P2P mobile payment app?',
        options: ['A) Venmo', 'B) Zelle', 'C) Square Cash', 'D) Google Pay'],
        answer: 'D) Google Pay',
      ),
      Question(
        type: 'mc',
        question:
            'Which party is responsible for authenticating credit cards and verifying account balances?',
        options: [
          'A) Merchant',
          'B) Issuing Bank',
          'C) Clearinghouse',
          'D) Consumer',
        ],
        answer: 'C) Clearinghouse',
      ),
      Question(
        type: 'mc',
        question:
            'Which technology is used to create a secure tunnel when sending credit card information?',
        options: ['A) QR Code', 'B) NFC', 'C) TLS', 'D) Blockchain'],
        answer: 'C) TLS',
      ),
      Question(
        type: 'mc',
        question:
            'Which of the following is NOT a dimension of e-commerce security?',
        options: [
          'A) Integrity',
          'B) Scalability',
          'C) Confidentiality',
          'D) Availability',
        ],
        answer: 'B) Scalability',
      ),
      Question(
        type: 'mc',
        question:
            'Which area shows tension between security and website operations?',
        options: [
          'A) Ease of Use',
          'B) Confidentiality',
          'C) Blockchain',
          'D) NFC',
        ],
        answer: 'A) Ease of Use',
      ),
      Question(
        type: 'mc',
        question:
            'Which dimension refers to the ability to control the use of personal information?',
        options: [
          'A) Privacy',
          'B) Availability',
          'C) Integrity',
          'D) Authenticity',
        ],
        answer: 'A) Privacy',
      ),
      Question(
        type: 'mc',
        question:
            'Which of the following was a major trend in e-commerce payments 2020–2021?',
        options: [
          'A) Decline of credit card use',
          'B) PayPal became less popular',
          'C) Mobile retail adoption skyrocketed',
          'D) Payment volume decreased',
        ],
        answer: 'C) Mobile retail adoption skyrocketed',
      ),
      Question(
        type: 'mc',
        question:
            'Which company introduced a credit card and entered the digital wallet market',
        options: ['A) Google', 'B) Apple', 'C) Samsung', 'D) PayPal'],
        answer: 'B) Apple',
      ),
      Question(
        type: 'mc',
        question:
            'Which of the following is a universal proximity mobile wallet usable at various merchants?',
        options: ['A) Walmart', 'B) Tesco', 'C) Starbucks', 'D) Apple Pay'],
        answer: 'D) Apple Pay',
      ),
      Question(
        type: 'mc',
        question:
            'What is the short-range wireless technology used for information sharing among devices?',
        options: ['A) NFC', 'B) QR Code', 'C) TLS', 'D) Blockchain'],
        answer: 'A) NFC',
      ),
      Question(
        type: 'mc',
        question: 'Which of the following uses a QR code to enable payment?',
        options: ['A) NFC', 'B) QR Code', 'C) TLS', 'D) Blockchain'],
        answer: 'B) QR Code',
      ),
      Question(
        type: 'mc',
        question:
            'Which of the following is NOT one of the five parties in an online credit card transaction?',
        options: [
          'A) Consumer',
          'B) Merchant Bank',
          'C) Clearinghouse',
          'D) Government',
        ],
        answer: 'D) Government',
      ),
      Question(
        type: 'mc',
        question:
            'What type of account must a merchant have to accept online credit card payments?',
        options: [
          'A) Checking Account',
          'B) Merchant Account',
          'C) Savings Account',
          'D) Stored Value Account',
        ],
        answer: 'B) Merchant Account',
      ),
      Question(
        type: 'mc',
        question:
            'Which of the following is NOT a traditional payment mechanism mentioned?',
        options: [
          'A) Cash',
          'B) Credit Cards',
          'C) Cryptocurrency',
          'D) Checking Accounts',
        ],
        answer: 'C) Cryptocurrency',
      ),
      Question(
        type: 'mc',
        question:
            'Which technology enables transactions without a central authority?',
        options: ['A) Blockchain', 'B) TLS', 'C) NFC', 'D) QR Code'],
        answer: 'A) Blockchain',
      ),
      Question(
        type: 'mc',
        question:
            'Which is the most prominent example of cryptocurrency in use today?',
        options: ['A) PayPal', 'B) Bitcoin', 'C) Apple Pay', 'D) Zelle'],
        answer: 'B) Bitcoin',
      ),
      Question(
        type: 'mc',
        question: 'Which party credits the merchant’s account with funds?',
        options: [
          'A) Issuing Bank',
          'B) Consumer',
          'C) Merchant',
          'D) Clearinghouse',
        ],
        answer: 'A) Issuing Bank',
      ),
    ],
    "ch5": [
      // True/False questions
      Question(
        type: 'tf',
        question:
            'Online marketing can be more personalized than traditional marketing.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'All types of online marketing share the personalized, participatory, peer-to-peer, and communal features.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'The objective of online marketing is to build customer relationships for above-average returns.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Search engine marketing uses display ads to attract consumers.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'Paid inclusion guarantees a website’s inclusion in a search engine’s list of sites for a fee.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Organic search inclusion depends on a keyword bidding process.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'Pay-per-click ads are the primary type of search engine advertising.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Keyword advertising requires merchants to purchase keywords through bidding.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question: 'Network keyword advertising pays only for ad impressions.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'A banner ad displays a promotional message in a rectangular box at the top or bottom of the screen.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question: 'Rich media ads do not include interactive features.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'Video ads appear as in-page video commercials before, during, or after content.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Sponsorship ties the advertiser’s name to an event in a purely noncommercial way.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question: 'Direct e-mail marketing is sent only to an opt-in audience.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question: 'Spam refers to email sent to an opt-in audience.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'Affiliate marketing pays only if users click a link or purchase a product.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question: 'Viral marketing depends on paying commission to websites.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'Social marketing uses online social networks and communities to build brands.',
        answer: 'T',
      ),
      Question(
        type: 'tf',
        question:
            'Web transaction logs do not record user activity on a website.',
        answer: 'F',
      ),
      Question(
        type: 'tf',
        question:
            'Cookies are small text files placed on the visitor’s hard disk.',
        answer: 'T',
      ),

      // Multiple choice questions
      Question(
        type: 'mc',
        question: 'Which is NOT a traditional online marketing tool?',
        options: [
          'A) Search engine marketing',
          'B) Viral marketing',
          'C) Marketing automation',
          'D) E-mail marketing',
        ],
        answer: 'C) Marketing automation',
      ),
      Question(
        type: 'mc',
        question:
            'Which search engine advertising type guarantees site inclusion for a fee?',
        options: [
          'A) Paid inclusion',
          'B) Organic search',
          'C) Pay-per-click',
          'D) Network advertising',
        ],
        answer: 'A) Paid inclusion',
      ),
      Question(
        type: 'mc',
        question: 'What does PPC stand for?',
        options: [
          'A) Pay-per-consumer',
          'B) Pay-per-click',
          'C) Pay-per-commerce',
          'D) Print-per-click',
        ],
        answer: 'B) Pay-per-click',
      ),
      Question(
        type: 'mc',
        question: 'Which ad type is an example of rich media?',
        options: [
          'A) Banner',
          'B) In-page video',
          'C) Interactive ad',
          'D) Text ad',
        ],
        answer: 'C) Interactive ad',
      ),
      Question(
        type: 'mc',
        question: 'What records user activity on an e-commerce site?',
        options: [
          'A) Cookies',
          'B) Web transaction logs',
          'C) Shopping cart database',
          'D) CRM system',
        ],
        answer: 'B) Web transaction logs',
      ),
      Question(
        type: 'mc',
        question: 'Which is NOT a primary tracking file?',
        options: [
          'A) Cookies',
          'B) Flash cookies',
          'C) Web beacons',
          'D) Shopping cart',
        ],
        answer: 'D) Shopping cart',
      ),
      Question(
        type: 'mc',
        question: 'What does a data warehouse do?',
        options: [
          'A) Manage customer relationships',
          'B) Collect analytical data in one location',
          'C) Send email marketing',
          'D) Display ads',
        ],
        answer: 'B) Collect analytical data in one location',
      ),
      Question(
        type: 'mc',
        question: 'What is data mining?',
        options: [
          'A) Analyzing patterns in data',
          'B) Creating transaction logs',
          'C) Designing ads',
          'D) Managing shopping carts',
        ],
        answer: 'A) Analyzing patterns in data',
      ),
      Question(
        type: 'mc',
        question:
            'Which term describes massive digital datasets beyond traditional DBMS?',
        options: ['A) CRM', 'B) SEM', 'C) Big Data', 'D) PPC'],
        answer: 'C) Big Data',
      ),
      Question(
        type: 'mc',
        question: 'What do marketing automation systems track?',
        options: [
          'A) Lead generation steps',
          'B) Transaction logs',
          'C) Cookie files',
          'D) Display ads',
        ],
        answer: 'A) Lead generation steps',
      ),
      Question(
        type: 'mc',
        question: 'What is the role of a CRM system?',
        options: [
          'A) Send search ads',
          'B) Store customer contact information',
          'C) Create profiles',
          'D) Manage cookies',
        ],
        answer: 'B) Store customer contact information',
      ),
      Question(
        type: 'mc',
        question: 'What data do registration forms gather?',
        options: [
          'A) Name, address, email',
          'B) Payment details',
          'C) Ad preferences',
          'D) Tracking files',
        ],
        answer: 'A) Name, address, email',
      ),
      Question(
        type: 'mc',
        question: 'What does the shopping cart database capture?',
        options: [
          'A) Item selection, purchase, payment data',
          'B) Profile files',
          'C) Cookies',
          'D) Organic search results',
        ],
        answer: 'A) Item selection, purchase, payment data',
      ),
      Question(
        type: 'mc',
        question: 'Which example describes viral marketing?',
        options: [
          'A) A banner ad',
          'B) Customers sharing a message',
          'C) Keyword bidding',
          'D) Transaction log',
        ],
        answer: 'B) Customers sharing a message',
      ),
      Question(
        type: 'mc',
        question: 'What distinguishes spam from an opt-in audience?',
        options: [
          'A) Spam to non-opt-in, opt-in to opted-in users',
          'B) Spam to opted-in, opt-in to non-opt-in',
          'C) They are the same',
          'D) No relation',
        ],
        answer: 'A) Spam to non-opt-in, opt-in to opted-in users',
      ),
      Question(
        type: 'mc',
        question: 'Which is NOT a function of a CRM system?',
        options: [
          'A) Track customer interactions',
          'B) Create registration forms',
          'C) Generate profiles',
          'D) Display ads',
        ],
        answer: 'D) Display ads',
      ),
      Question(
        type: 'mc',
        question: 'Which tool uses user-generated content?',
        options: [
          'A) Viral Marketing',
          'B) SEM',
          'C) CRM',
          'D) Data Warehouse',
        ],
        answer: 'A) Viral Marketing',
      ),
    ],
  };

  static List<Question> getChapterQuestions(
    String chapterKey,
    String languageCode,
  ) {
    if (languageCode == 'ar') {
      return arabicChapterQuestions[chapterKey] ?? [];
    }
    return englishChapterQuestions[chapterKey] ?? [];
  }

  static List<String> getAvailableChapterKeysForLocale(String languageCode) {
    if (languageCode == 'ar') {
      return arabicChapterQuestions.keys
          .where((key) => arabicChapterQuestions[key]!.isNotEmpty)
          .toList();
    }
    return englishChapterQuestions.keys
        .where((key) => englishChapterQuestions[key]!.isNotEmpty)
        .toList();
  }

  static List<Question> getAllQuestionsForLocale(String languageCode) {
    List<Question> all = [];
    if (languageCode == 'ar') {
      arabicChapterQuestions.values.forEach((list) => all.addAll(list));
    } else {
      englishChapterQuestions.values.forEach((list) => all.addAll(list));
    }
    return all;
  }
}
