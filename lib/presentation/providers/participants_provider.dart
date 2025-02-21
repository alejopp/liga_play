import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liga_play/data/db/database_config.dart';
import 'package:liga_play/data/db/entities/participants_entity.dart';

final participantsProvider =
    StateNotifierProvider<ParticipantsNotifier, ParticipantsState>((ref) {
  return ParticipantsNotifier(ParticipantsState());
});

class ParticipantsNotifier extends StateNotifier<ParticipantsState> {
  ParticipantsNotifier(super._state) {
    init();
  }

  init() {
    final participants = DatabaseConfig.loadParticipants();
    if (participants.isNotEmpty) {
      state.participants = participants;
    }
  }

  addParticipant(Participant participant) {
    List<Participant> participantsCopy = List.from(state.participants);
    print(participantsCopy);
    participantsCopy.add(participant);
    state = state.copyWith(participants: participantsCopy);
    DatabaseConfig.saveParticipant(participant);
  }

  removeParticipant(String participant) {
    List<Participant> participantsCopy = List.from(state.participants);
    print(participantsCopy);
    if (participantsCopy.isEmpty) return;
    participantsCopy.removeLast();
    state = state.copyWith(participants: participantsCopy);
  }
}

class ParticipantsState {
  List<Participant> participants;

  ParticipantsState({this.participants = const []});

  ParticipantsState copyWith({List<Participant>? participants}) =>
      ParticipantsState(participants: participants ?? this.participants);
}
