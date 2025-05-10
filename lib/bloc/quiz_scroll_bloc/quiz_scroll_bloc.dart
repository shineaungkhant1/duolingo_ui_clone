import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quiz_scroll_event.dart';

class QuizScrollBloc extends Bloc<QuizScrollEvent, double> {
  QuizScrollBloc() : super(0) {
    on<QuizScrollEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
