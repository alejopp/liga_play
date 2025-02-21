// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participants_entity.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Participant extends _Participant
    with RealmEntity, RealmObjectBase, RealmObject {
  Participant(
    String name,
  ) {
    RealmObjectBase.set(this, 'name', name);
  }

  Participant._();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<Participant>> get changes =>
      RealmObjectBase.getChanges<Participant>(this);

  @override
  Stream<RealmObjectChanges<Participant>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Participant>(this, keyPaths);

  @override
  Participant freeze() => RealmObjectBase.freezeObject<Participant>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'name': name.toEJson(),
    };
  }

  static EJsonValue _toEJson(Participant value) => value.toEJson();
  static Participant _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'name': EJsonValue name,
      } =>
        Participant(
          fromEJson(name),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Participant._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, Participant, 'Participant', [
      SchemaProperty('name', RealmPropertyType.string, primaryKey: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
