part of 'home_bloc.dart';



abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}
class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final Map<String, List<Item>> groupedItems;

  const HomeLoaded(this.groupedItems);

  @override
  List<Object> get props => [groupedItems];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
