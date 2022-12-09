import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../../graphql/model/objetos.dart';

class ListPage extends StatefulWidget {
  Assitance resultado;
  late List<String> memoria = [];
  ListPage({Key? key, required this.resultado}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    widget.resultado.detailsAssistance.forEach((element) {
      widget.memoria.add(element.details);
    });
    super.initState();
  }

  final List<String> items = ['Forma', 'Atraso', 'Permiso', 'Falta'];

  @override
  Widget build(BuildContext context) {
    String informacion(int index) {
      String resultado = '';
      int contador = 0;
      widget.memoria.forEach((element) {
        if (contador == index) {
          resultado = element;
        }
        contador++;
      });
      return resultado;
    }

    return Scaffold(
        appBar: AppBar(
            title: Text(
              widget.resultado.name,
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            leading: BackButton(
              color: Colors.black,
            )),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (() async {
            String start = '{"data":{"asistencia":[';

            List<String> body = [];

            for (int i = 0;
                i < widget.resultado.detailsAssistance.length;
                i++) {
              start =
                  '$start{"usuario":${widget.resultado.detailsAssistance[i].id},"detalle":"${widget.memoria[i]}"},';
            }
            final pos = start.length - 1;
            String result = start.substring(0, pos);
            String end = ']}}';
            result = result + end;

            print(widget.resultado.id);
            var headers = {
              'Authorization':
                  'Bearer f2ea3dcb9a523172e269a2be160cb1959e3752d45c3a3055a64cb6601d2902541e4508f425bfff2cff8ff1ee5e24366fbb041eddc965400f21093e3f8c0f7d1601fc79965036c49b1d13f1644e41ff69ded9b95b129223acba11918cdfb25254a07cb807be8dd164a11a11c6c4132a1bc6114951b18ab651351fe52b7172c37d',
              'Content-Type': 'application/json'
            };
            var request = http.Request(
                'PUT',
                Uri.parse(
                    'http://161.97.151.134:8070/api/assistances/${widget.resultado.id}'));
            request.body = result;
            print(request.body);
            request.headers.addAll(headers);

            http.StreamedResponse response = await request.send();

            if (response.statusCode == 200) {
              print(await response.stream.bytesToString());
            } else {
              print(response.reasonPhrase);
            }
          }),
          label: const Text('Cargar Parte'),
        ),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: ListView.builder(
              itemCount: widget.resultado.detailsAssistance.length,
              itemBuilder: (BuildContext context, int index) {
                DetailsAssitance e = widget.resultado.detailsAssistance[index];
                return ListTile(
                  title:
                      Text("   ${e.firstName} ${e.lastNameF} ${e.lastNameM}"),
                  trailing: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              informacion(index),
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
                      items: items
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
                      value: informacion(index),
                      onChanged: (value) {
                        setState(() {
                          widget.memoria[index] = value as String;
                        });
                      },
                      iconEnabledColor: Colors.yellow,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 160,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.redAccent,
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.redAccent,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(-20, 0),
                    ),
                  ),
                );
              }),
        ));
  }
}
