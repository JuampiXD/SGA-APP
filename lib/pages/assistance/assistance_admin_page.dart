import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sga/pages/assistance/list_page.dart';
import 'package:sizer/sizer.dart';
import '../../graphql/GraphQLConfig.dart';
import '../../graphql/model/objetos.dart';

class AcordionEditable extends StatefulWidget {
  List<Assitance> resultado;
  AcordionEditable({Key? key, required this.resultado}) : super(key: key);

  @override
  State<AcordionEditable> createState() => _AcordionEditableState();
}

class _AcordionEditableState extends State<AcordionEditable> {
  final List<String> detalle = ['Forma', 'Atraso', 'Permiso', 'Falta'];
  String? selectedValue;
  @override
  Widget build(
    BuildContext context,
  ) {
    return ListView(
        children: widget.resultado
            .map(
              (e) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            alignment: Alignment.center,
                            duration: Duration(milliseconds: 500),
                            child: GraphQLProvider(
                              client: GraphQLConfiguration.clientToQuery(),
                              child: ListPage(resultado: e),
                            )));
                  },
                  child: Container(
                      color: Colors.blue,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            e.name,
                            textScaleFactor: 1.3,
                            style: const TextStyle(fontFamily: "RobotoBold"),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                              DateFormat.yMMMd('es')
                                      .format(DateTime.tryParse(e.date)!) +
                                  "      " +
                                  DateFormat.jm('es')
                                      .format(DateTime.tryParse(e.date)!),
                              style:
                                  const TextStyle(fontFamily: "RobotoItalic"))
                        ],
                      ))),
            )
            .toList());
  }
}
