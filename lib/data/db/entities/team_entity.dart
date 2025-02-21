import 'package:realm/realm.dart';

part 'team_entity.realm.dart';

@RealmModel()
class _TeamEntity {
  @PrimaryKey()
  late String name;
  late int gamesPlayed;
  late int goalsFavor;
  late int goalAgainst;
  late int goalDifference;
  late int points;
}
