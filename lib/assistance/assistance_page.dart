import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sga/graphql/model/objetos.dart';
import 'package:sizer/sizer.dart';

import '../../graphql/GraphQLConfig.dart';
import '../../graphql/QueryCollections.dart';
import '../../graphql/model/database.dart';
import '../../tools/fail_connection.dart';
import '../../tools/loading.dart';

class AssistancePage extends StatefulWidget {
  String email;

  AssistancePage({required this.email});

  @override
  State<AssistancePage> createState() => _AssistancePageState();
}

class _AssistancePageState extends State<AssistancePage> {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLConfiguration.clientToQuery(),
      child: Query(
          options: QueryOptions(
              document: gql(QueryCollections().getMyAssistance(widget.email))),
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

            return Padding(
              padding: EdgeInsets.only(top: 5.h),

              child: Accordion(
                  children: resultado
                      .map((e) => AccordionSection(
                      header: Container(

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              e.name,
                              textScaleFactor: 1.3,
                              style:
                              const TextStyle(fontFamily: "RobotoBold"),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                                DateTime.tryParse(e.date)!
                                    .toString()
                                    .split(" ")[0],
                                style: const TextStyle(
                                    fontFamily: "RobotoItalic"))
                          ],
                        ),
                      ),
                      content: Column(
                        children: e.detailsAssistance
                            .map((e) => Container(
                          child: Column(
                            children: [
                              Row(
                                children: [ Text(e.firstName + " " + e.lastName),Text(e.details)],
                              )
                            ],
                          ),
                        ))
                            .toList(),
                      )))
                      .toList()),
            );
          }),
    );
  }
}
