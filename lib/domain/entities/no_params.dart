import 'package:equatable/equatable.dart';

// this class is for those API's that don't require query parameters.
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
