import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List<String> mensagensRequisitosParaDoacao = [
    "Requisitos Para Doação: ",
    " - Apresentar documento de identidade original com foto, emitido por orgão oficial" +
        "(R.G., carteira de motorista, etc);",
    " - Ter entre 18 e 69 anos (desde que a primeira doação tenha sido realizada até os 60 anos);",
    " - Pesar acima de 50kg;",
    " - Dormir pelo menos 6 horas na noite que antecede a doação;",
    " - Realizar uma refeição completa na noite que antecede a doação (jantar);",
    " - NÃO FAZER JEJUM. Fazer refeições leves e não gordurosas; ",
    " - Não ingerir bebida alcoólica de 12 à 24 horas antes da doação;",
    " - Não fumar 1 horas antes e 1 hora depois da doação;",
    " - Não praticar exercícios físicos exagerados antes e após a doação;",
    " - Em caso de 1° doação, não conduzir moto ou bicicleta e não ser conduzido na garupa de ambos;",
    " - Se a doção for realizada após o almoço, esperar o intervalo de 3 horas para realizar a doação. ",
    " - É necessário permanecer no Serviço Hemoterápico após a doação por 15 minutos.",
    " - Não forçar o braço após o ato da doação para evitar sangramentos e hematomas, manter o curativo por pelo menos 1 hora.",
    "Quem Deve Aguardar: ",
    " - Quem fez algum tipo de tratamento dentário, aguardar de 1 à 30 dias, dependendo do procedimento;",
    " - Quem recebeu transfusão de sangue aguardar 1 ano;",
    " - Piercing, tatuagens e maquiagem definitiva, aguardar 6 meses após o procedimento;",
    " - Piercing na língua, boca e região genital, aguardar 1 ano após a retirada;",
    " - Acupuntura com material próprio ou descartável e feito por médicos o técnicos autorizados, aguardar 6 meses;",
    " - Quem estiver com gripe, diarreia, infecção de garganta, tomando antibiótico ou anti-inflamatório, aguardar 15 dias após estar curado;",
    " - Parto ou aborto, aguardar 3 meses. Se estiver amamentando, aguardar 1 ano.",
    " - Quem foi submetido a cirurgia, aguardar de 3 à 12 meses, dependendo do procedimento;",
    " - Vacinas, a depender de qual vacina esperar de 48 horas à 30 dias;",
    " - Vacina de Sarampo aguardar 30 dias;",
    " - Vacina contra raiva, aguardar 12 meses (quando há mordida de algum animal);",
    " - Quem tiver recebido soro antitetânico/antiofídico aguardar 1 ano;",
    " - Endoscopia ou colonoscopia, aguardar 6 meses;",
    " - Quem esteve em área endemica ou em surtos de doenças transmissíveis, aguardar 1 mês;",
    " - Quem tem pressão alta é necessário informar o medicamento que está usando;",
    " - Pré-diabéticos irá depender da quantidade de medicamento que está usando;",
    " - Diabéticos não podem doar."
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Informações Uteis"),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: mensagensRequisitosParaDoacao.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Container(
              margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Text(
                mensagensRequisitosParaDoacao[index],
                style: TextStyle(fontSize: 20),
              ),
            );
          },
        ),
      ),
    );
  }
}
