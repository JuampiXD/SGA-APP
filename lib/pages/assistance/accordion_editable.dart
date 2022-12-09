import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sizer/sizer.dart';
import '../../graphql/model/objetos.dart';

class AcordionEditable extends StatefulWidget {
  List<Assitance> resultado;
  AcordionEditable({Key? key, required this.resultado}) : super(key: key);

  @override
  State<AcordionEditable> createState() => _AcordionEditableState();
}

class _AcordionEditableState extends State<AcordionEditable> {
  final List<String> detalle = ['Forma', 'Atraso', 'Permiso', 'Falta'];
  @override
  Widget build(
    BuildContext context,
  ) {
    return Accordion(
      // headerBackgroundColor: Colors.amber,

      headerBackgroundColorOpened: Colors.black54,
      scaleWhenAnimating: true,
      openAndCloseAnimation: true,
      headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      children: widget.resultado
          .map(
            (e) => AccordionSection(
                headerBackgroundColor: e.status ? Colors.green : Colors.amber,
                isOpen: false,
                leftIcon: const Icon(Icons.bookmark, color: Colors.white),
                header: Column(
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
                        style: const TextStyle(fontFamily: "RobotoItalic"))
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
                                  textAlign: TextAlign.left)),
                              DataCell(DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                isExpanded: true,
                                hint: Row(
                                  children: const [
                                    Icon(
                                      Icons.list,
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Detalle',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                items: detalle
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                              ))),
                            ],
                          ))
                      .toList(),
                )),
          )
          .toList(),
    );
  }
}
