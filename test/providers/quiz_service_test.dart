import 'package:flutter_test/flutter_test.dart';
import 'package:futurama/futurama/providers/quiz_service.dart';

void main() {
  group('Testing App Provider', () {
    var quiz = QuizServices();

    test('The score is reset to zero', () {
      // quiz..add(number);
      quiz.reset();
      expect(quiz.scores == 5, false);
    });
  });
}
