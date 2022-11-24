import 'package:flutter/material.dart';


import '../home_widgets/home_drawer.dart';
import 'database_helper.dart';

class CadExerci extends StatefulWidget {
  const CadExerci({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CadExerciState createState() => _CadExerciState();
}

class _CadExerciState extends State<CadExerci> {
  // All data
  List<Map<String, dynamic>> meuData = [];
  final formKey = GlobalKey<FormState>();

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshData() async {
    final data = await DatabaseHelper.getItems();
    setState(() {
      meuData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData(); // Loading the data when the app starts
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void showMyForm(int? id) async {
    if (id != null) {
      final existingData = meuData.firstWhere((element) => element['id'] == id);
      _titleController.text = existingData['nome_exe'];
      _descriptionController.text = existingData['descris'];
    } else {
      _titleController.text = "";
      _descriptionController.text = "";
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isDismissible: false,
        isScrollControlled: true,
        builder: (_) => Container(
            padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              // prevent the soft keyboard from covering the text fields
              bottom: MediaQuery.of(context).viewInsets.bottom + 120,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    controller: _titleController,
                    validator: formValidator,
                    decoration:
                        const InputDecoration(hintText: 'Nome do Exercicio'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: formValidator,
                    controller: _descriptionController,
                    decoration: const InputDecoration(hintText: 'Descrição'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Sair")),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            if (id == null) {
                              await addItem();
                            }

                            if (id != null) {
                              await updateItem(id);
                            }

                            // Clear the text fields
                            setState(() {
                              _titleController.text = '';
                              _descriptionController.text = '';
                            });

                            // Close the bottom sheet
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          }
                          // Save new data
                        },
                        child: Text(
                            id == null ? 'Adicionar um novo' : 'Atualizar'),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }

  String? formValidator(String? value) {
    if (value!.isEmpty) return 'Insira o valor';
    return null;
  }

// Insert a new data to the database
  Future<void> addItem() async {
    await DatabaseHelper.createItem(
        _titleController.text, _descriptionController.text);
    _refreshData();
  }

  // Update an existing data
  Future<void> updateItem(int id) async {
    await DatabaseHelper.updateItem(
        id, _titleController.text, _descriptionController.text);
    _refreshData();
  }

  // Delete an item
  void deleteItem(int id) async {
    await DatabaseHelper.deleteItem(id);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Deletado com sucesso!'), backgroundColor: Colors.green));
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("CADASTRO DE EXERCICIO"),
          centerTitle: true,
          backgroundColor: const Color(0xff0A6D92)),
      drawer: getHomeDrawer(BuildContext, context),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : meuData.isEmpty
              ? const Center(child: Text(""))
              : ListView.builder(
                  itemCount: meuData.length,
                  itemBuilder: (context, index) => Card(
                    color: Color.fromARGB(255, 169, 220, 238),
                    margin: const EdgeInsets.all(15),
                    child: ListTile(
                        title: Text(meuData[index]['nome_exe']),
                        subtitle: Text(meuData[index]['descris']),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () =>
                                    showMyForm(meuData[index]['id']),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () =>
                                    deleteItem(meuData[index]['id']),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showMyForm(null),
      ),
    );
  }
}
