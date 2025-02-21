class FixtureUtils {

  static createFixture(List<List<String>> matches, int numberOfParticipants) {
    final matchesPerFixture = numberOfParticipants / 2;

    final List<List<String>> fixture = [];
    final List<String> match = [];

    for (var tempMatch in matches) {
      final homeTeam = tempMatch.first;
      final visitorTeam = tempMatch.last;

      while (match.length < matchesPerFixture) {

        if (match.contains(homeTeam)) {
          //TODO Pendiente de investigación
        }
      }
    }
  }
}