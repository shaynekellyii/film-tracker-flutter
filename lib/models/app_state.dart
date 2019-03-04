import 'package:film_tracker/models/roll.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<Roll> rolls;

  AppState({
    this.isLoading = false,
    this.rolls = const [],
  });

  factory AppState.loading() => AppState(isLoading: true);

  AppState copyWith({
    bool isLoading,
    List<Roll> rolls,
  }) =>
      AppState(
        isLoading: isLoading ?? this.isLoading,
        rolls: rolls ?? this.rolls,
      );

  @override
  int get hashCode => isLoading.hashCode ^ rolls.hashCode;

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is AppState && isLoading == other.isLoading && rolls == other.rolls;

  @override
  String toString() => 'AppState{isLoading: $isLoading, rolls: $rolls}';
}
