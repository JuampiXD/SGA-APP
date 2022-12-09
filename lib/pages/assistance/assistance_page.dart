import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sga/graphql/model/objetos.dart';
import 'package:sga/pages/assistance/assistance_admin_page.dart';
import 'package:sga/pages/assistance/profile_page.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../../graphql/GraphQLConfig.dart';
import '../../graphql/QueryCollections.dart';
import '../../graphql/model/database.dart';
import '../../tools/fail_connection.dart';
import '../../tools/loading.dart';

class AssistancePage extends StatefulWidget {
  User usuario;

  AssistancePage({Key? key, required this.usuario}) : super(key: key);

  @override
  State<AssistancePage> createState() => _AssistancePageState();
}

class _AssistancePageState extends State<AssistancePage> {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es');
    return GraphQLProvider(
      client: GraphQLConfiguration.clientToQuery(),
      child: Query(
          options: QueryOptions(
              document:
                  gql(QueryCollections().getInfoUsers(widget.usuario.email))),
          builder: (QueryResult result, {refetch, fetchMore}) {
            if (result.hasException) {
              return const Fail_Connection(
                descriptions: "No hay conexión a Internet",
              );
            }

            if (result.isLoading) {
              return Container(
                margin: EdgeInsets.only(top: 25.h),
                child: const Loading(),
              );
            }

            List<Assitance> resultado = DataBase().getAssistance(result);

            User usuario = DataBase().getInfoUser(result);

            return Column(
              children: [
                ProfilePage(
                  usuario: usuario,
                ),
                Expanded(
                    child: usuario.rol != "ESTUDIANTE"
                        ? AcordionEditable(resultado: resultado)
                        : Accordion(
                            // headerBackgroundColor: Colors.amber,

                            headerBackgroundColorOpened: Colors.black54,
                            scaleWhenAnimating: true,
                            openAndCloseAnimation: true,
                            headerPadding: const EdgeInsets.symmetric(
                                vertical: 7, horizontal: 15),
                            children: resultado
                                .map(
                                  (e) => AccordionSection(
                                      headerBackgroundColor: e.status
                                          ? Colors.green
                                          : Colors.amber,
                                      isOpen: false,
                                      leftIcon: const Icon(Icons.bookmark,
                                          color: Colors.white),
                                      header: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            e.name,
                                            textScaleFactor: 1.3,
                                            style: const TextStyle(
                                                fontFamily: "RobotoBold"),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                              DateFormat.yMMMd('es').format(
                                                      DateTime.tryParse(
                                                          e.date)!) +
                                                  "      " +
                                                  DateFormat.jm('es').format(
                                                      DateTime.tryParse(
                                                          e.date)!),
                                              style: const TextStyle(
                                                  fontFamily: "RobotoItalic"))
                                        ],
                                      ),
                                      content: DataTable(
                                        sortAscending: true,
                                        sortColumnIndex: 1,
                                        dataRowHeight: 40,
                                        showBottomBorder: false,
                                        columns: const [
                                          DataColumn(
                                              label: Text(
                                            'Nombre',
                                            textAlign: TextAlign.left,
                                          )),
                                          DataColumn(
                                              label: Text(
                                            'Detalle',
                                          )),
                                        ],
                                        rows: e.detailsAssistance
                                            .map((e) => DataRow(
                                                  cells: [
                                                    DataCell(Text(
                                                        "${e.firstName} ${e.lastNameF} ${e.lastNameM}",
                                                        textAlign:
                                                            TextAlign.left)),
                                                    DataCell(Text(
                                                        e.details.replaceAll(
                                                            '_', ' '),
                                                        textAlign:
                                                            TextAlign.left)),
                                                  ],
                                                ))
                                            .toList(),
                                      )),
                                )
                                .toList(),
                          ))
              ],
            );
          }),
    );
  }
}
