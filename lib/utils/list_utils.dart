import 'dart:math';

import 'package:liga_play/data/db/entities/participants_entity.dart';
import 'package:liga_play/data/db/entities/team_entity.dart';

class ListUtils {
  static List<List<String>> combine(List<Participant> participants) {
    List<List<String>> pairs = getPairs(participants);

    print(participants);
    // Mostrar las parejas
    for (var pair in pairs) {
      print(pair);
    }

    return pairs;
  }

  static List<List<String>> shuffleMatches(List<List<String>> matches) {
    matches.shuffle(Random());
    return matches;
  }

  static List<List<String>> getPairs(List<Participant> customList) {
    List<List<String>> pairs = [];

    for (int i = 0; i < customList.length; i++) {
      for (int j = i + 1; j < customList.length; j++) {
        pairs.add([customList[i].name, customList[j].name]);
      }
    }

    return pairs;
  }

  static List<TeamEntity> sortByPointsAndGoals(List<TeamEntity> teams) {
    // Ordenar la lista
    teams.sort((a, b) {
      // Comparar por la posición 3
      int cmp = b.points.compareTo(a.points);
      if (cmp != 0) return cmp;

      // Comparar por la posición 2 si la posición 3 es igual
      cmp = b.goalDifference.compareTo(a.goalDifference);
      if (cmp != 0) return cmp;

      // Comparar por la posición 1 si las posiciones 3 y 2 son iguales
      return b.goalsFavor.compareTo(a.goalsFavor);
    });
    return teams;
  }
}
