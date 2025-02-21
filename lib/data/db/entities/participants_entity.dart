import 'package:realm/realm.dart';

part 'participants_entity.realm.dart';

@RealmModel()
class _Participant {
  @PrimaryKey()
  late String name;
}
