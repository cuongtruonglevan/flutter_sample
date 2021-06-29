part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeFailedLoading extends HomeState {
  final dynamic exception;

  HomeFailedLoading(this.exception);

  @override
  List<Object?> get props => [this.exception];
}

class HomeLoaded extends HomeState {
  HomeLoaded();

  @override
  List<Object?> get props => [];
}

class HomeEmpty extends HomeState {
  @override
  List<Object?> get props => [];
}
