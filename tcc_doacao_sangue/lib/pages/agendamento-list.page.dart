import 'package:flutter/material.dart';
import 'package:tcc_doacao_sangue/models/agendamento.model.dart';
import 'package:tcc_doacao_sangue/repositories/agendamento.repository.dart';
import 'package:tcc_doacao_sangue/widgets/connection-manager.widget.dart';

class ListaAgendamentoPage extends StatefulWidget {
  @override
  _ListaAgendamentoPageState createState() => _ListaAgendamentoPageState();
}

class _ListaAgendamentoPageState extends State<ListaAgendamentoPage> {
  final agendamentoRepository = new AgendamentoRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Agendamentos"),
      ),
      body: ConnectionManager(
        future: agendamentoRepository.get(),
        func: listarAlagamentos,
        progressIndicator: true,
      ),
    );
  }

  Widget listarAlagamentos(BuildContext context, AsyncSnapshot snapshot) {
    List<Agendamento> agendamentos = snapshot.data;

    return DataTable(
        columnSpacing: 80,
        onSelectAll: (b) {},
        sortColumnIndex: 1,
        sortAscending: true,
        columns: <DataColumn>[
          DataColumn(
            label: Text("Hemocentro"),
            numeric: false,
            onSort: (i, b) {
              print("$i $b");
              setState(() {
                agendamentos.sort(
                    (a, b) => a.hemocentroDesc.compareTo(b.hemocentroDesc));
              });
            },
          ),
          DataColumn(
            label: Text("Status"),
            numeric: false,
            onSort: (i, b) {
              print("$i $b");
            },
          ),
          DataColumn(
            label: Text("Ações"),
            numeric: false,
            onSort: (i, b) {
              print("$i $b");
            },
          ),
        ],
        rows: agendamentos
            .map(
              (name) => DataRow(
                cells: [
                  DataCell(
                    Text(name.nome),
                    showEditIcon: false,
                    placeholder: false,
                  ),
                  DataCell(
                    Text(name.agendado ? "Ativo" : "Inativo"),
                    showEditIcon: false,
                    placeholder: false,
                  ),
                  DataCell(
                    FlatButton(
                      child: Icon(Icons.delete),
                      onPressed: () {},
                    ),
                    showEditIcon: false,
                    placeholder: false,
                  )
                ],
              ),
            )
            .toList());
  }
}
