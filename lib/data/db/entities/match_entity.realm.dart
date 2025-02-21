// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_entity.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MatchEntity extends _MatchEntity
    with RealmEntity, RealmObjectBase, RealmObject {
  MatchEntity(
    String id,
    String homeTeam,
    String homeScore,
    String awayTeam,
    String awayScore,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'homeTeam', homeTeam);
    RealmObjectBase.set(this, 'homeScore', homeScore);
    RealmObjectBase.set(this, 'awayTeam', awayTeam);
    RealmObjectBase.set(this, 'awayScore', awayScore);
  }

  MatchEntity._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get homeTeam =>
      RealmObjectBase.get<String>(this, 'homeTeam') as String;
  @override
  set homeTeam(String value) => RealmObjectBase.set(this, 'homeTeam', value);

  @override
  String get homeScore =>
      RealmObjectBase.get<String>(this, 'homeScore') as String;
  @override
  set homeScore(String value) => RealmObjectBase.set(this, 'homeScore', value);

  @override
  String get awayTeam =>
      RealmObjectBase.get<String>(this, 'awayTeam') as String;
  @override
  set awayTeam(String value) => RealmObjectBase.set(this, 'awayTeam', value);

  @override
  String get awayScore =>
      RealmObjectBase.get<String>(this, 'awayScore') as String;
  @override
  set awayScore(String value) => RealmObjectBase.set(this, 'awayScore', value);

  @override
  Stream<RealmObjectChanges<MatchEntity>> get changes =>
      RealmObjectBase.getChanges<MatchEntity>(this);

  @override
  Stream<RealmObjectChanges<MatchEntity>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<MatchEntity>(this, keyPaths);

  @override
  MatchEntity freeze() => RealmObjectBase.freezeObject<MatchEntity>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'homeTeam': homeTeam.toEJson(),
      'homeScore': homeScore.toEJson(),
      'awayTeam': awayTeam.toEJson(),
      'awayScore': awayScore.toEJson(),
    };
  }

  static EJsonValue _toEJson(MatchEntity value) => value.toEJson();
  static MatchEntity _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'homeTeam': EJsonValue homeTeam,
        'homeScore': EJsonValue homeScore,
        'awayTeam': EJsonValue awayTeam,
        'awayScore': EJsonValue awayScore,
      } =>
        MatchEntity(
          fromEJson(id),
          fromEJson(homeTeam),
          fromEJson(homeScore),
          fromEJson(awayTeam),
          fromEJson(awayScore),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(MatchEntity._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, MatchEntity, 'MatchEntity', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('homeTeam', RealmPropertyType.string),
      SchemaProperty('homeScore', RealmPropertyType.string),
      SchemaProperty('awayTeam', RealmPropertyType.string),
      SchemaProperty('awayScore', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
