import 'package:pip/features/home/data/models/ad_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Ads> ads;

  SearchLoaded(this.ads);
}

class SearchEmpty extends SearchState {}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}