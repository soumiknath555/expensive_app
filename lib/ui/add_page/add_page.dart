import 'package:expense_app/data/model/expance_model.dart';
import 'package:expense_app/ui/dashboard_pages/nav_pages/home/bloc/expanse_event.dart';
import 'package:expense_app/ui/dashboard_pages/nav_pages/home/bloc/expense_bloc.dart';
import 'package:expense_app/ui/dashboard_pages/nav_pages/home/bloc/expense_state.dart';
import 'package:expense_app/utils/app_constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  int selectedCatIndex = -1;

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
            DropdownMenu(
                width: double.infinity,
                initialSelection: selectedType,
                menuStyle: MenuStyle(
                  minimumSize: WidgetStatePropertyAll(Size(MediaQuery
                      .of(context)
                      .size
                      .width - 42, 200)),
                  maximumSize: WidgetStatePropertyAll(Size(MediaQuery
                      .of(context)
                      .size
                      .width - 42, 200)),
                  backgroundColor: WidgetStatePropertyAll(Colors.green.shade50),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21))),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: Colors.green.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                ),
                dropdownMenuEntries: mType.map((e) {
                  return DropdownMenuEntry(value: e, label: e);
                }).toList()),
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
                              itemCount: AppConstance.mCatList.length,
                              itemBuilder: (_,index){
                                return Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: InkWell(
                                    onTap: () {
                                      selectedCatIndex = index;
                                      ss(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          AppConstance.mCatList[index].catIamge,
                                          width: 50, height: 50,),
                                        SizedBox(height: 11,),
                                        Text(AppConstance.mCatList[index]
                                            .catName)
                                      ],
                                    ),
                                  ),
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
                    child: selectedCatIndex < 0 ? Text(
                      "Select Category",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ) : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppConstance.mCatList[selectedCatIndex]
                            .catIamge, width: 40, height: 40,),
                        SizedBox(width: 11,),
                        Text(AppConstance.mCatList[selectedCatIndex].catName,
                          style: TextStyle(color: Colors.black, fontSize: 18),),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 11,),

            SizedBox(
              width: double.infinity,
              height: 60,
              child: BlocListener<ExpenseBloc, ExpenseState>(
                listener: (context, state) {
                  if(state is ExpenseErrorState){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                  }
                  if(state is ExpenseLoadingState){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 11,),
                        Text("Adding Your Expense....."),

                      ],
                    ),duration: Duration(seconds: 1),));
                  }

                  if(state is ExpenseLoadedState){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Expense Added Successfully"),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                }, child: OutlinedButton(
                onPressed: () async {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty &&
                      amountController.text.isNotEmpty) {
                    if (selectedCatIndex >= 0) {
                      String title = titleController.text;
                      String desc = descriptionController.text;
                      num amt = double.parse(amountController.text);
                      num bal = 0;
                      String createAt = (selectedDate ?? DateTime.now())
                          .millisecondsSinceEpoch.toString();
                      int catId = AppConstance.mCatList[selectedCatIndex].catId;


                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      int userId = prefs.getInt(AppConstance.PREF_USER_ID_KEY) ?? 0;

                      ExpenseModel newExpense = ExpenseModel(
                          user_id: userId,
                          title: title,
                          description: desc,
                          amt: amt,
                          bal: bal,
                          cat_id: catId,
                          created_at: createAt,
                          type: selectedType == "Debit" ? 1: 2); // selectedType 2 er besi hole ki hobe ?

                      context.read<ExpenseBloc>().add(AddExpenseEvent(newExpense: newExpense));


                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please select a Category")));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill all the fields")));
                  }
                },
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.green.shade400,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21))
                ),
                child: Text("Add Expense", style: TextStyle(fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),),),
              ),
            )
          ],
        ),
      ),


    );
  }
}
