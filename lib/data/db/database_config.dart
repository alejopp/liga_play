import 'package:liga_play/data/db/entities/match_entity.dart';
import 'package:liga_play/data/db/entities/participants_entity.dart';
import 'package:liga_play/data/db/entities/team_entity.dart';
import 'package:realm/realm.dart';

class DatabaseConfig {
  static final _config = Configuration.local(
    [TeamEntity.schema, MatchEntity.schema, Participant.schema],
  );

  static final _realm = Realm(_config);

  static saveTeamStandings(List<TeamEntity> teams) {
    for (var team in teams) {
      try {
        _realm.write(
          () {
            _realm.add(
              team,
              update: true,
            );
          },
        );
      } catch (e) {
        print(e);
      }
    }
  }

  static saveFixture(List<MatchEntity> matches) {
    for (var match in matches) {
      _realm.write(() {
        _realm.add(match, update: true);
      });
    }
  }

  static List<TeamEntity> loadStandings() {
    final RealmResults<TeamEntity> standings =
        _realm.query("TRUEPREDICATE SORT(points DESC)");
    return standings
        .map((t) => TeamEntity(t.name, t.gamesPlayed, t.goalsFavor,
            t.goalAgainst, t.goalDifference, t.points))
        .toList();
  }

  static List<MatchEntity> loadMatches() {
    final matches = _realm.all<MatchEntity>().toList();
    return matches;
  }

  static void updateHomeScore(MatchEntity match, int value) {
    _realm.write(() {
      match.homeScore = value.toString();
    });
  }

  static void updateAwayScore(MatchEntity match, int value) {
    _realm.write(() {
      match.awayScore = value.toString();
    });
  }

  static void saveParticipant(Participant participant) {
    _realm.write(() {
      _realm.add(participant, update: true);
    });
  }

  static List<Participant> loadParticipants() {
    final participants = _realm.all<Participant>().toList();
    return participants;
  }

  static Future<void> deleteData() async {
    try {
      Future(() {
        _realm.write(
          () {
            _realm.deleteAll<TeamEntity>();
            _realm.deleteAll<Participant>();
            _realm.deleteAll<MatchEntity>();
          },
        );
      });
    } catch (e) {
      print("Error al eliminar datos $e");
    }
  }
}
