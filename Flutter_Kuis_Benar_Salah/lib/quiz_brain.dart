import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(questionText: 'Benyamin Sueb adalah seniman dan komedian Betawi', questionAnswer: true),
    Question(questionText: 'Benyamin Sueb pernah menjabat sebagai Gubernur DKI', questionAnswer: false),
    Question(questionText: 'Anak Benyamin Sueb ada yang menjadi politisi di Indonesia', questionAnswer: true),
    Question(questionText: 'Bahasa Betawi baju merah adalah cukin mereh', questionAnswer: true),
    Question(questionText: 'Tanjidor adalah grup musik dengan pengaruh Portugis dan Belanda', questionAnswer: true),
    Question(questionText: 'Benyamin Sueb dikenal sebagai pemeran H. Tile di film Doel Anak Sekolah', questionAnswer: false),
    Question(questionText: 'Atun adalah adeknya Doel dan crush nya mas Karyo', questionAnswer: true),
    Question(questionText: 'Benyamin Sueb menguasai Bahasa Sunda dengan lancar', questionAnswer: true),
    Question(questionText: 'Benyamin Sueb pandai mengarang lagu keroncong, sunda, jaz, dangdut, dan pop', questionAnswer: true),
    Question(questionText: 'Nama Benyamin Sueb diabadikan sebagai nama daerah di Jakarta Utara', questionAnswer: false),
    Question(questionText: 'Benyamin Sueb wafat karena serangan jantung akibat bermain bola', questionAnswer: true),
    Question(questionText: 'Mas Karyo hobinya bermain burung', questionAnswer: true),
    Question(questionText: 'Benyamin Sueb pernah berperan sebagai waria di film Manusia Sedeng', questionAnswer: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    return _questionNumber >= _questionBank.length - 1;
  }

  int getTotalQuestions() {
    return _questionBank.length;
  }

  void reset() {
    _questionNumber = 0;
  }
}
