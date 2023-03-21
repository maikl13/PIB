import 'package:bloc/bloc.dart';
import '../../../home/data/models/ad_model.dart';
import 'search_event.dart';
import 'search_state.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/web_services/network_exceptions.dart';
import '../../data/repository/repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;

  SearchBloc(this.searchRepository) : super(SearchInitial()) {
    on<SearchTextChanged>(
      (event, emit) => search(emit, event.query),
      transformer: (eventsStream, mapper) => eventsStream
          // .where((event) => event.query.length >= 2)
          .debounceTime(const Duration(milliseconds: 300))
          .distinct()
          .switchMap(mapper),
    );
  }

  void search(Function emit, String searchText) async {
    emit(SearchLoading());

    if (searchText.isEmpty) {
      emit(SearchEmpty());
    }
    var result = await searchRepository.getSearchResults(searchText);
    result.when(
      success: (List<Ads> ads) {
        emit(SearchLoaded(ads));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(SearchError(networkExceptions.toString()));
      },
    );
  }
}
