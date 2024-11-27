import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'qr_code_screen_state.dart';

class QrCodeScreenCubit extends Cubit<QrCodeScreenState> {
  QrCodeScreenCubit() : super(QrCodeScreenInitial());
}
