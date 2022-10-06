import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sga/graphql/model/objetos.dart';
import 'package:sizer/sizer.dart';

import '../../graphql/GraphQLConfig.dart';
import '../../graphql/QueryCollections.dart';
import '../../graphql/model/database.dart';
import '../../tools/fail_connection.dart';
import '../../tools/loading.dart';

class CoursePage extends StatefulWidget {
  String email;

  CoursePage({required this.email});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLConfiguration.clientToQuery(),
      child: Query(
          options: QueryOptions(
              document: gql(QueryCollections().getClassmates(widget.email))),
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

            Course resultado = DataBase().getCourse(result);

            return Column(
              children: [
                Container(

                    width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    color: const Color(0xffDFD2C6),
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.h, bottom: 4.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            resultado.name.toUpperCase(),
                            textScaleFactor: 2,
                            style: const TextStyle(fontFamily: "RobotoBold"),
                          ),
                          Text(
                            resultado.career.replaceAll("_", " "),
                            textScaleFactor: 1.2,
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(top: 2.h),
                        itemCount: resultado.classmates.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            decoration: const BoxDecoration(
                                color: Color(0xffDFD2C6),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            margin: EdgeInsets.symmetric(
                                horizontal: 2.h, vertical: 1.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.h, vertical: 3.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${resultado.classmates.elementAt(index).firstName} ${resultado.classmates.elementAt(index).lastName}",
                                  textScaleFactor: 1.3,
                                  style:
                                      const TextStyle(fontFamily: "RobotoBold"),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                    resultado.classmates.elementAt(index).email,
                                    style: const TextStyle(
                                        fontFamily: "RobotoItalic"))
                              ],
                            ),
                          );
                        }))
              ],
            );
          }),
    );
  }
}
