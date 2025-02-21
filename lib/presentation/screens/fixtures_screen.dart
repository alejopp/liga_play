import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liga_play/models/fixture.dart';
import 'package:liga_play/presentation/providers/fixture_provider.dart';
import 'package:liga_play/presentation/providers/standings_provider.dart';
import 'package:liga_play/presentation/widgets/custom_primary_button.dart';
import 'package:liga_play/presentation/widgets/fixture_item.dart';

class FixturesScreen extends ConsumerStatefulWidget {
  const FixturesScreen({super.key});

  static const String name = 'fixtures_screen';
  static const String route = '/$name';

  @override
  ConsumerState createState() => _FixturesScreenState();
}

class _FixturesScreenState extends ConsumerState<FixturesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) async {
          ref.read(standingsProvider.notifier).calculateTeamData();
          print("pikachu didpop");
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("FECHAS"),
            centerTitle: true,
          ),
          body: _buildBody(),
        ),
      ),
    );
  }

  _buildBody() {
    return Column(
      children: [_buildFixtureList(), _buildStandingsButton()],
    );
  }

  _buildFixtureList() {
    final matches =
        ref.watch(fixtureProvider.select((value) => value.fixtures));
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: matches.length,
        itemBuilder: (BuildContext context, int index) {
          return FixtureItem(
            matchIndex: index,
            fixtureElement: Fixture(
              homeTeam: matches[index].homeTeam,
              awayTeam: matches[index].awayTeam,
              homeScore: matches[index].homeScore,
              awayScore: matches[index].awayScore,
            ),
          );
        },
      ),
    );
  }

  _buildStandingsButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: CustomPrimaryButton(
          onTapped: () {
            ref.read(standingsProvider.notifier).calculateTeamData();
            Navigator.pop(context);
          },
          buttonText: 'Ver tabla'),
    );
  }
}
