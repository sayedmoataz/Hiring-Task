import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'formscreen_state.dart';

class FormscreenCubit extends Cubit<FormscreenState> {
  FormscreenCubit() : super(FormscreenInitial());
}
