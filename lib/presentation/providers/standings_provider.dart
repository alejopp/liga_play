import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liga_play/data/db/database_config.dart';
import 'package:liga_play/data/db/entities/team_entity.dart';
import 'package:liga_play/presentation/providers/fixture_provider.dart';
import 'package:liga_play/presentation/providers/participants_provider.dart';
import 'package:liga_play/utils/list_utils.dart';

final standingsProvider =
    StateNotifierProvider.autoDispose<StandingsNotifier, StandingsState>((ref) {
  return StandingsNotifier(StandingsState(teams: []), ref);
});

class StandingsNotifier extends StateNotifier<StandingsState> {
  final Ref ref;

  StandingsNotifier(super._state, this.ref) {
    init();
  }

  init() {
    final standings = DatabaseConfig.loadStandings();
    if (standings.isEmpty) {
      calculateTeamData();
    } else {
      updateStandings(standings);
    }
  }

  calculateTeamData() {
    print("calculateTeamData method exceuted");
    final participants =
        ref.read(participantsProvider.select((value) => value.participants));
    final matches = ref.read(fixtureProvider.select((value) => value.fixtures));
    final List<TeamEntity> teams = [];
    TeamEntity? teamTemp;
    for (var participant in participants) {
      teamTemp = TeamEntity(participant.name, 0, 0, 0, 0, 0);
      for (var match in matches) {
        // Home section
        if (match.homeTeam == teamTemp.name) {
          if (match.homeScore.isEmpty || match.awayScore.isEmpty) continue;
          final goalsFavor = int.tryParse(match.homeScore) ?? 0;
          final goalAgainst = int.tryParse(match.awayScore) ?? 0;
          final goalDifference = goalsFavor - goalAgainst;
          teamTemp.gamesPlayed += 1;
          teamTemp.goalsFavor += goalsFavor;
          teamTemp.goalAgainst += goalAgainst;
          teamTemp.goalDifference += goalDifference;
          if (goalDifference > 0) {
            teamTemp.points += 3;
          } else if (goalDifference == 0) {
            teamTemp.points += 1;
          }
        }
        // Away section
        if (match.awayTeam == teamTemp.name) {
          if (match.homeScore.isEmpty || match.awayScore.isEmpty) continue;
          final goalsFavor = int.tryParse(match.awayScore) ?? 0;
          final goalAgainst = int.tryParse(match.homeScore) ?? 0;
          final goalDifference = goalsFavor - goalAgainst;
          teamTemp.gamesPlayed += 1;
          teamTemp.goalsFavor += goalsFavor;
          teamTemp.goalAgainst += goalAgainst;
          teamTemp.goalDifference += goalDifference;
          if (goalDifference > 0) {
            teamTemp.points += 3;
          } else if (goalDifference == 0) {
            teamTemp.points += 1;
          }
        }
      }
      teams.add(teamTemp);
    }
    final standingsTeamsSorted = ListUtils.sortByPointsAndGoals(teams);
    updateStandings(standingsTeamsSorted);
  }

  updateStandings(List<TeamEntity> standingsTeamsSorted) {
    state = state.copyWith(teams: standingsTeamsSorted);
    DatabaseConfig.saveTeamStandings(standingsTeamsSorted);
  }
}

class StandingsState {
  final List<TeamEntity> teams;

  StandingsState({required this.teams});

  StandingsState copyWith({List<TeamEntity>? teams}) =>
      StandingsState(teams: teams ?? this.teams);
}
