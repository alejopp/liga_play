import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liga_play/data/db/entities/participants_entity.dart';
import 'package:liga_play/presentation/providers/participants_provider.dart';
import 'package:liga_play/presentation/screens/standings_screen.dart';
import 'package:liga_play/presentation/widgets/custom_primary_button.dart';

class SelectTeamScreen extends ConsumerStatefulWidget {
  static const String name = 'select_team_screen';
  static const String route = '/$name';

  const SelectTeamScreen({super.key});

  @override
  ConsumerState createState() => _SelectTeamScreenState();
}

class _SelectTeamScreenState extends ConsumerState<SelectTeamScreen> {
  final textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("PARTICIPANTES"),
        centerTitle: true,
      ),
      body: _buildBody(),
    ));
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(child: _buildAddTeamTextField()),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Expanded(child: _buildAddTeamButton()),
              Expanded(child: _buildRemoveTeamButton())
            ],
          ),
          SizedBox(
            height: 20,
          ),
          _buildTeamsList(),
          _buildStartButton()
        ],
      ),
    );
  }

  Widget _buildAddTeamTextField() {
    return TextField(
      maxLines: 1,
      maxLength: 25,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        label: Text("Ingresar equipo"),
      ),
      controller: textFieldController,
    );
  }

  CustomPrimaryButton _buildAddTeamButton() {
    return CustomPrimaryButton(
      onTapped: () {
        ref
            .read(participantsProvider.notifier)
            .addParticipant(Participant(textFieldController.text));
        textFieldController.clear();
      },
      buttonText: "Agregar",
    );
  }

  CustomPrimaryButton _buildRemoveTeamButton() {
    return CustomPrimaryButton(
      onTapped: () {
        ref
            .read(participantsProvider.notifier)
            .removeParticipant(textFieldController.text);
        textFieldController.clear();
      },
      buttonText: "Quitar",
      backgroundColour: Color(0xFF028090),
    );
  }

  Widget _buildTeamsList() {
    final participants =
        ref.watch(participantsProvider.select((value) => value.participants));
    return Column(
      children: [
        SizedBox(
          width: 350,
          child: DataTable(
            columns: const [
              DataColumn(
                  label: Text('EQUIPO'),
                  headingRowAlignment: MainAxisAlignment.start),
            ],
            rows: participants.map((participant) {
              return DataRow(cells: [
                DataCell(
                  Text(participant.name),
                )
              ]);
            }).toList(),
          ),
        )
      ],
    );
  }

  Padding _buildStartButton() {
    final List<Participant> participants =
        ref.watch(participantsProvider.select((value) => value.participants));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: CustomPrimaryButton(
          buttonText: "Comenzar",
          onTapped: participants.length > 1
              ? () {
                  Navigator.pushNamed(context, StandingsScreen.route);
                }
              : null),
    );
  }
}
