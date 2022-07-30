import 'package:equatable/equatable.dart';

// this class just holds the Error message
class AppError extends Equatable {
  final String message;

  const AppError(this.message);

  @override
  List<Object?> get props => [message];
}
