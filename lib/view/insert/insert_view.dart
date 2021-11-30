import 'package:apf/app_view_model.dart';
import 'package:apf/model/funcao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InsertView extends StatefulWidget {
  @override
  _InsertViewState createState() => _InsertViewState();
}

class _InsertViewState extends State<InsertView> {
  Funcao funcao = Funcao(
      nome: '',
      tipoFuncao: TipoFuncao.ALI,
      tipoManutencao: TipoManutencao.INCLUSAO);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _tdController = TextEditingController(text: '0');

  final TextEditingController _arController = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inserir Nova Função'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            funcao.nome = _nameController.text;
            funcao.td = double.parse(_tdController.text);
            funcao.tr = double.parse(_arController.text);
            context.read<AppViewModel>().addFuncao(funcao);
            Navigator.pop(context);
          }
        },
        child: Icon(Icons.check),
        backgroundColor: Color(0xff70e000),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _nameController,
                  validator: (String? name) {
                    if (name == null || name.isEmpty) {
                      return 'Nome inválido';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Nome da Função',
                    border: const OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _tdController,
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null ||
                        !(double.tryParse(value) != null &&
                            double.parse(value) >= 0)) {
                      return 'Quantidade inválida';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Tipos de Dados',
                    border: const OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: _arController,
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null ||
                        !(double.tryParse(value) != null &&
                            double.parse(value) >= 0)) {
                      return 'Quantidade inválida';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Arquivos Referenciados',
                    border: const OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text('Tipo: '),
                        DropdownButton<TipoFuncao>(
                          value: funcao.tipoFuncao,
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.blueAccent),
                          underline: Container(
                            height: 2,
                            color: Colors.blueAccent,
                          ),
                          onChanged: (TipoFuncao? newValue) {
                            setState(() {
                              funcao.tipoFuncao = newValue!;
                            });
                          },
                          items: TipoFuncao.values
                              .map<DropdownMenuItem<TipoFuncao>>(
                                  (TipoFuncao value) {
                            var text =
                                value.toString().replaceAll('TipoFuncao.', '');
                            return DropdownMenuItem<TipoFuncao>(
                              value: value,
                              child: Text(text),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text('Manutenção: '),
                        DropdownButton<TipoManutencao>(
                          value: funcao.tipoManutencao,
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.blueAccent),
                          underline: Container(
                            height: 2,
                            color: Colors.blueAccent,
                          ),
                          onChanged: (TipoManutencao? newValue) {
                            setState(() {
                              funcao.tipoManutencao = newValue!;
                            });
                          },
                          items: TipoManutencao.values
                              .map<DropdownMenuItem<TipoManutencao>>(
                                  (TipoManutencao value) {
                            var text = value
                                .toString()
                                .replaceAll('TipoManutencao.', '');
                            return DropdownMenuItem<TipoManutencao>(
                              value: value,
                              child: Text(text),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Divider(
                thickness: 3,
                indent: 15,
                endIndent: 15,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Complexidade: ${funcao.complexidade.toString().replaceAll('Complexidade.', '')}'),
                    const SizedBox(height: 8),
                    Text('PF: ${funcao.pf}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
