import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liga_play/models/fixture.dart';
import 'package:liga_play/presentation/providers/fixture_provider.dart';

class FixtureItem extends ConsumerStatefulWidget {
  final int matchIndex;
  final Fixture? fixtureElement;

  const FixtureItem({
    super.key,
    required this.matchIndex,
    this.fixtureElement,
  });

  @override
  ConsumerState<FixtureItem> createState() => _FixtureItemState();
}

class _FixtureItemState extends ConsumerState<FixtureItem> {
  final homeScoreTextFieldController = TextEditingController();
  final awayScoreTextFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    homeScoreTextFieldController.text =
        widget.fixtureElement?.homeScore.toString() ?? "";
    awayScoreTextFieldController.text =
        widget.fixtureElement?.awayScore.toString() ?? "";
  }

  @override
  void dispose() {
    super.dispose();
    homeScoreTextFieldController.dispose();
    awayScoreTextFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            "${widget.fixtureElement?.homeTeam}",
            textAlign: TextAlign.center,
          )),
          SizedBox(
            width: 50,
            child: TextField(
              maxLines: 1,
              maxLength: 2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(counterText: ''),
              onChanged: (value) {
                ref.read(fixtureProvider.notifier).updateHomeScore(
                    (int.tryParse(homeScoreTextFieldController.text) ?? 0),
                    widget.matchIndex);
              },
              controller: homeScoreTextFieldController,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(" VS "),
          ),
          SizedBox(
            width: 50,
            child: TextField(
              maxLines: 1,
              maxLength: 2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(counterText: ''),
              onChanged: (value) {
                ref.read(fixtureProvider.notifier).updateAwayScore(
                    (int.tryParse(awayScoreTextFieldController.text) ?? 0),
                    widget.matchIndex);
              },
              controller: awayScoreTextFieldController,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              child: Text("${widget.fixtureElement?.awayTeam}",
                  textAlign: TextAlign.center))
        ],
      ),
    );
  }
}
