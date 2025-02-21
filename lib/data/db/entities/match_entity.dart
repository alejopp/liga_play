import 'package:realm/realm.dart';

part 'match_entity.realm.dart';

@RealmModel()
class _MatchEntity {
  @PrimaryKey()
  late String id;
  late String homeTeam;
  late String homeScore;
  late String awayTeam;
  late String awayScore;
}
