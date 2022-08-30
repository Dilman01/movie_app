import 'package:equatable/equatable.dart';

// this class just holds the Error message
class AppError extends Equatable {
  final AppErrorType appErrorType;

  const AppError(this.appErrorType);

  @override
  List<Object?> get props => [appErrorType];
}

enum AppErrorType {
  api,
  network,
}
