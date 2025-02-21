// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_entity.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TeamEntity extends _TeamEntity
    with RealmEntity, RealmObjectBase, RealmObject {
  TeamEntity(
    String name,
    int gamesPlayed,
    int goalsFavor,
    int goalAgainst,
    int goalDifference,
    int points,
  ) {
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'gamesPlayed', gamesPlayed);
    RealmObjectBase.set(this, 'goalsFavor', goalsFavor);
    RealmObjectBase.set(this, 'goalAgainst', goalAgainst);
    RealmObjectBase.set(this, 'goalDifference', goalDifference);
    RealmObjectBase.set(this, 'points', points);
  }

  TeamEntity._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  int get gamesPlayed => RealmObjectBase.get<int>(this, 'gamesPlayed') as int;
  @override
  set gamesPlayed(int value) => RealmObjectBase.set(this, 'gamesPlayed', value);

  @override
  int get goalsFavor => RealmObjectBase.get<int>(this, 'goalsFavor') as int;
  @override
  set goalsFavor(int value) => RealmObjectBase.set(this, 'goalsFavor', value);

  @override
  int get goalAgainst => RealmObjectBase.get<int>(this, 'goalAgainst') as int;
  @override
  set goalAgainst(int value) => RealmObjectBase.set(this, 'goalAgainst', value);

  @override
  int get goalDifference =>
      RealmObjectBase.get<int>(this, 'goalDifference') as int;
  @override
  set goalDifference(int value) =>
      RealmObjectBase.set(this, 'goalDifference', value);

  @override
  int get points => RealmObjectBase.get<int>(this, 'points') as int;
  @override
  set points(int value) => RealmObjectBase.set(this, 'points', value);

  @override
  Stream<RealmObjectChanges<TeamEntity>> get changes =>
      RealmObjectBase.getChanges<TeamEntity>(this);

  @override
  Stream<RealmObjectChanges<TeamEntity>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<TeamEntity>(this, keyPaths);

  @override
  TeamEntity freeze() => RealmObjectBase.freezeObject<TeamEntity>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'name': name.toEJson(),
      'gamesPlayed': gamesPlayed.toEJson(),
      'goalsFavor': goalsFavor.toEJson(),
      'goalAgainst': goalAgainst.toEJson(),
      'goalDifference': goalDifference.toEJson(),
      'points': points.toEJson(),
    };
  }

  static EJsonValue _toEJson(TeamEntity value) => value.toEJson();
  static TeamEntity _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'name': EJsonValue name,
        'gamesPlayed': EJsonValue gamesPlayed,
        'goalsFavor': EJsonValue goalsFavor,
        'goalAgainst': EJsonValue goalAgainst,
        'goalDifference': EJsonValue goalDifference,
        'points': EJsonValue points,
      } =>
        TeamEntity(
          fromEJson(name),
          fromEJson(gamesPlayed),
          fromEJson(goalsFavor),
          fromEJson(goalAgainst),
          fromEJson(goalDifference),
          fromEJson(points),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(TeamEntity._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, TeamEntity, 'TeamEntity', [
      SchemaProperty('name', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('gamesPlayed', RealmPropertyType.int),
      SchemaProperty('goalsFavor', RealmPropertyType.int),
      SchemaProperty('goalAgainst', RealmPropertyType.int),
      SchemaProperty('goalDifference', RealmPropertyType.int),
      SchemaProperty('points', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
