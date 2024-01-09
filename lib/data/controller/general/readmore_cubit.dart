import '../../../exports.dart';

class ReadMoreCubit extends Cubit<bool> {
  ReadMoreCubit() : super(false);

  void toggle() => emit(!state);
}