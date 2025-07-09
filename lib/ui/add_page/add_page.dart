import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddPage extends StatefulWidget {
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  String selectedType = "Debit";
  List<String> mType = ["Debit", "Credit"];

  DateTime? selectedDate;
  DateFormat df = DateFormat.yMMMd();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Page",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Your Expense",
              style: TextStyle(
                fontSize: 30,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 11),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.green.shade50,
                prefixIcon: Icon(Icons.title),
                hintText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
            SizedBox(height: 11),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.green.shade50,
                prefixIcon: Icon(Icons.description),
                hintText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
            SizedBox(height: 11),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.green.shade50,
                prefixIcon: Icon(Icons.money),
                hintText: "Amount",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
            SizedBox(height: 11),
            DropdownButtonFormField<String>(
              value: selectedType,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.green.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
              items: mType.map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedType = value!;
                });
              },
            ),
            SizedBox(height: 11),
            SizedBox(
              width: double.infinity,
              child: StatefulBuilder(
                builder: (context, ss) {
                  return OutlinedButton(
                    onPressed: () async {
                      selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(Duration(days: 730)),
                        lastDate: DateTime.now(),
                      );
                      ss(() {});
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60),
                      backgroundColor: Colors.green.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                      side: BorderSide(color: Colors.black, width: 1),
                    ),
                    child: Text(
                      df.format(selectedDate ?? DateTime.now()),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 11),

            SizedBox(
              width: double.infinity,
              child: StatefulBuilder(
                builder: (context, ss) {
                  return OutlinedButton(
                    onPressed: () async {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return Container(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                  ),
                              itemBuilder: (_,index){
                                return Column(
                                  children: [
                                    Image.asset("")
                                  ],
                                );

                              },
                            ),
                          );
                        },
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60),
                      backgroundColor: Colors.green.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                      side: BorderSide(color: Colors.black, width: 1),
                    ),
                    child: Text(
                      "Select Category",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),


    );
  }
}
