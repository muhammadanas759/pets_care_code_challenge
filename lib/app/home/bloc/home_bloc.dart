
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_library/movie_library.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MovieRepository apiService;

  HomeBloc(this.apiService) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      on<SearchQueryChanged>(_onSearchQueryChanged);
    });
  }
  void _onSearchQueryChanged(SearchQueryChanged event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final items = await apiService.searchItems(event.query);
      final groupedItems = _groupItemsByType(items);
      emit(HomeLoaded(groupedItems));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Map<String, List<Item>> _groupItemsByType(List<Item> items) {
    final Map<String, List<Item>> groupedItems = {};
    for (var item in items) {
      if (!groupedItems.containsKey(item.type)) {
        groupedItems[item.type??"test"] = [];
      }
      groupedItems[item.type]!.add(item);
    }
    return groupedItems;
  }
}



