import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liga_play/data/db/database_config.dart';
import 'package:liga_play/presentation/providers/participants_provider.dart';
import 'package:liga_play/presentation/providers/standings_provider.dart';
import 'package:liga_play/presentation/screens/fixtures_screen.dart';
import 'package:liga_play/presentation/screens/select_team_screen.dart';
import 'package:liga_play/presentation/widgets/custom_primary_button.dart';
import 'package:liga_play/utils/dialog_utils.dart';

class StandingsScreen extends ConsumerStatefulWidget {
  static const String name = 'standings_screen';
  static const String route = '/$name';

  const StandingsScreen({super.key});

  @override
  ConsumerState createState() => _StandingsScreenState();
}

class _StandingsScreenState extends ConsumerState<StandingsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) {
      ref.read(standingsProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TABLA DE POSICIONES"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: _buildBody(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF00A896),
          onPressed: onFabPressed,
          child: Icon(Icons.delete_forever),
        ),
      ),
    ));
  }

  _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildStandingsTable(),
        SizedBox(
          height: 40,
        ),
        _buildFixtureButton(),
      ],
    );
  }

  _buildStandingsTable() {
    final teams = ref.watch(standingsProvider.select((value) => value.teams));
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('EQUIPO')),
          DataColumn(label: Text('PJ')),
          DataColumn(label: Text('GF')),
          DataColumn(label: Text('GC')),
          DataColumn(label: Text('DG')),
          DataColumn(label: Text('PTS')),
        ],
        rows: teams.map((team) {
          return DataRow(cells: [
            DataCell(Text(team.name)),
            DataCell(Text(team.gamesPlayed.toString())),
            DataCell(Text(team.goalsFavor.toString())),
            DataCell(Text(team.goalAgainst.toString())),
            DataCell(Text(team.goalDifference.toString())),
            DataCell(Text(team.points.toString())),
          ]);
        }).toList(),
      ),
    );
  }

  _buildFixtureButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: CustomPrimaryButton(
        buttonText: 'Fechas',
        onTapped: () {
          Navigator.pushNamed(context, FixturesScreen.route);
        },
      ),
    );
  }

  onFabPressed() async {
    DialogUtils.showCustomDialog(
      context,
      title: "Terminar torneo",
      description:
          "¿Estás seguro que deseas terminar el torneo? Todos los datos se borrarán",
      onCancelButtonPressed: () {
        Navigator.of(context).pop(false);
      },
      onConfirmButtonPressed: () async {
        await DatabaseConfig.deleteData();
        ref.invalidate(participantsProvider);
        if (context.mounted) {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(SelectTeamScreen.route);
        }
      },
    );
  }
}
