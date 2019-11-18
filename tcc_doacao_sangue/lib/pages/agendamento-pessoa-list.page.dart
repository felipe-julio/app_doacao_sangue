import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tcc_doacao_sangue/models/agendamento.model.dart';
import 'package:tcc_doacao_sangue/repositories/agendamento.repository.dart';
import 'package:tcc_doacao_sangue/widgets/connection-manager.widget.dart';

class ListaAgendamentoPessoaPage extends StatefulWidget {
  @override
  _ListaAgendamentoPessoaPageState createState() =>
      _ListaAgendamentoPessoaPageState();
}

class _ListaAgendamentoPessoaPageState
    extends State<ListaAgendamentoPessoaPage> {
  final agendamentoRepository = new AgendamentoRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Agendamentos Solicitados"),
      ),
      body: ConnectionManager(
        future: agendamentoRepository.get(),
        func: listarAgendamentos,
        progressIndicator: true,
      ),
    );
  }

  Widget listarAgendamentos(BuildContext context, AsyncSnapshot snapshot) {
    List<Agendamento> agendamentos = snapshot.data;

    return DataTable(
        columnSpacing: 30,
        onSelectAll: (b) {},
        sortColumnIndex: 1,
        sortAscending: true,
        columns: <DataColumn>[
          DataColumn(
            label: Text("Nome"),
            numeric: false,
            onSort: (i, b) {
              print("$i $b");
              setState(() {
                agendamentos.sort((a, b) => a.nome.compareTo(b.nome));
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
            label: Text("Horário"),
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
                    Text(DateFormat("dd-MM-yyyy HH:mm").format(DateTime.now())),
                    showEditIcon: false,
                    placeholder: false,
                  ),
                  DataCell(
                    name.agendado
                        ? Container(
                            margin: EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(2),
                              ),
                            ),
                            child: FlatButton(
                              child: Text(
                                "Recusar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              onPressed: () => {},
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(2),
                              ),
                            ),
                            child: FlatButton(
                              child: Text(
                                "Aceitar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              onPressed: () => {},
                            ),
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
