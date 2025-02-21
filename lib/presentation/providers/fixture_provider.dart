import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liga_play/data/db/database_config.dart';
import 'package:liga_play/data/db/entities/match_entity.dart';
import 'package:liga_play/data/db/entities/participants_entity.dart';
import 'package:liga_play/presentation/providers/participants_provider.dart';
import 'package:liga_play/utils/list_utils.dart';

final fixtureProvider =
    StateNotifierProvider<FixtureNotifier, FixtureState>((ref) {
  return FixtureNotifier(FixtureState(), ref);
});

class FixtureNotifier extends StateNotifier<FixtureState> {
  final Ref ref;

  FixtureNotifier(super._state, this.ref) {
    init();
  }

  init() {
    final standings = DatabaseConfig.loadStandings();
    if (standings.isEmpty) {
      final participants =
          ref.read(participantsProvider.select((value) => value.participants));
      createFixture(participants);
    } else {
      loadFixture();
    }
  }

  updateHomeScore(int value, int matchIndex) {
    final List<MatchEntity> fixturesCopy = List.from(state.fixtures);
    print("Fixture copy: $fixturesCopy");
    final match = fixturesCopy[matchIndex];
    DatabaseConfig.updateHomeScore(match, value);
    state = state.copyWith(fixtures: fixturesCopy);
  }

  updateAwayScore(int value, int matchIndex) {
    final List<MatchEntity> fixturesCopy = List.from(state.fixtures);
    var match = state.fixtures[matchIndex];
    DatabaseConfig.updateAwayScore(match, value);
    state = state.copyWith(fixtures: fixturesCopy);
  }

  void createFixture(List<Participant> participants) {
    final matches = ListUtils.combine(participants);
    final List<MatchEntity> fixtures = [];
    final List<List<String>> shuffledMatches =
        ListUtils.shuffleMatches(matches);
    for (var match in shuffledMatches) {
      fixtures.add(
        MatchEntity(
          DateTime.now().toString(),
          match.first,
          "",
          match.last,
          "",
        ),
      );
    }
    updateMatches(fixtures);
  }

  void updateMatches(List<MatchEntity> matches) {
    state = state.copyWith(fixtures: matches);
    DatabaseConfig.saveFixture(matches);
  }

  void loadFixture() {
    final matches = DatabaseConfig.loadMatches();
    state = state.copyWith(fixtures: matches);
  }
}

class FixtureState {
  final List<MatchEntity> fixtures;

  FixtureState({this.fixtures = const []});

  FixtureState copyWith({List<MatchEntity>? fixtures}) =>
      FixtureState(fixtures: fixtures ?? this.fixtures);
}
