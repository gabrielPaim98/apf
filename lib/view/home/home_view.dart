import 'package:apf/app_view_model.dart';
import 'package:apf/view/insert/insert_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APF'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(96),
          child: Container(
            height: 96,
            margin: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    double? custoPF;
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Alterar Custo/PF:'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Custo/PF',
                                  border: const OutlineInputBorder(),
                                ),
                                onChanged: (String? custo) {
                                  if (custo != null &&
                                      custo.isNotEmpty &&
                                      double.tryParse(custo) != null &&
                                      double.parse(custo) >= 0)
                                    custoPF = double.parse(custo);
                                },
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  if (custoPF != null)
                                    context
                                        .read<AppViewModel>()
                                        .setCustoPPF(custoPF!);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  color: Colors.blueAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        'Confirmar',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Custo/PF: R\$ ${context.watch<AppViewModel>().aplicacao.custoPPF.toStringAsFixed(2).replaceAll('.', ',')}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'PF Total: ${context.watch<AppViewModel>().aplicacao.totalPF}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Custo Total: R\$ ${context.watch<AppViewModel>().aplicacao.custoTotal.toStringAsFixed(2).replaceAll('.', ',')}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Consumer<AppViewModel>(builder: (context, appViewModel, child) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(
            vertical: 32,
          ),
          itemBuilder: (context, index) {
            if (appViewModel.aplicacao.funcoes.length == index) {
              return SizedBox(
                height: 120,
              );
            }
            return ListTile(
              title: Text(appViewModel.aplicacao.funcoes[index].nome),
              onLongPress: () {
                appViewModel.removeFuncao(index);
              },
              trailing: Text(
                  'PF: ${appViewModel.aplicacao.funcoes[index].pf}\n${appViewModel.aplicacao.funcoes[index].complexidade.toString().replaceAll('Complexidade.', '')}'),
              subtitle: Text("""
${appViewModel.aplicacao.funcoes[index].tipoFuncao.toString().replaceAll('Funcao.', ': ')}
${appViewModel.aplicacao.funcoes[index].tipoManutencao.toString().replaceAll('TipoManutencao.', 'Manutenção: ')}
Tipos de dados: ${appViewModel.aplicacao.funcoes[index].td}
Arquivos referenciados: ${appViewModel.aplicacao.funcoes[index].tr}
                """),
            );
          },
          separatorBuilder: (context, index) => Divider(
            height: 16,
            thickness: 1,
            color: Colors.black54,
          ),
          itemCount: appViewModel.aplicacao.funcoes.length + 1,
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InsertView(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
