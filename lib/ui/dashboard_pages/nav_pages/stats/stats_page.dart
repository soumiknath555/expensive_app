import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  String selectedValue = 'Month';
  List<String> mListType = ["Month", "Week", "Day"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Statistic",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),

                  /* DropdownButtonFormField<String>(
                    value: selectedValue,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.green.shade50,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    items: mListType.map((e){
                      return DropdownMenuItem(value: e, child: Text(e),);
                    }).toList(),
                    onChanged: (value){

                    },
                  ),*/
                  Row(
                    children: [
                      Text("This Month"),
                      Icon(Icons.keyboard_arrow_down, color: Colors.green),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xFF402880),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Total expense",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Spacer(),
                          Icon(Icons.more_horiz, color: Colors.white),
                        ],
                      ),
                      SizedBox(height: 11),

                      Container(
                        height: 35,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\$5000",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 11,),

                            Text("/ \$4000",style: TextStyle(color: Colors.white60,fontSize: 15),),
                            SizedBox(width: 11,),
                            
                            Text("per month",style: TextStyle(color: Colors.white60,fontSize: 15),),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Container(
                width: double.infinity,
                height: 300,
                // color: Colors.green.shade50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Expense Breakdown",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),

                        /* DropdownButtonFormField<String>(
                          value: selectedValue,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.green.shade50,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                          items: mListType.map((e){
                            return DropdownMenuItem(value: e, child: Text(e),);
                          }).toList(),
                          onChanged: (value){

                          },
                        ),*/
                        Row(
                          children: [
                            Text("Week"),
                            Icon(Icons.keyboard_arrow_down, color: Colors.green),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 1,),
                    Row(
                      children: [
                        Text("Limit",style: TextStyle(fontSize: 15,color: Colors.black54),),
                        SizedBox(width: 5,),
                        Text("\$4000",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400, color: Colors.black54),),
                        SizedBox(width: 5,),
                        Text("/ week",style: TextStyle(fontSize: 15,color: Colors.black54),),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        // height: 250,
                        width: double.infinity,

                        child: BarChart(
                            BarChartData(
                                maxY: 100,
                                barGroups: [
                                  BarChartGroupData(x: 0,
                                      barRods: [
                                        _barUI(toY: 65, color: Colors.red)
                                      ]),
                                  BarChartGroupData(x: 1,
                                      barRods: [
                                        _barUI(toY: 49, color: Colors.blue)
                                      ]),
                                  BarChartGroupData(x: 2,
                                      barRods: [
                                       _barUI(toY: 78, color: Colors.green)
                                      ]),
                                  BarChartGroupData(x: 3,
                                      barRods: [
                                        _barUI(toY: 45, color: Colors.yellow)
                                      ]),
                                  BarChartGroupData(x: 4,
                                      barRods: [
                                        _barUI(toY: 95, color: Colors.purple)
                                      ]),
                                ]
                            )
                        ),
                      ),
                    )


                  ],
                ),
              ),
              
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.green.shade50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Spending Details",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 1,),
                    Text("Your expense are divided into 6 categories",
                      style: TextStyle(fontSize: 16, color: Colors.black54),),
                    SizedBox(height: 11,),
                    Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(11),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  BarChartRodData _barUI ({required double toY , required Color color}){
    return BarChartRodData(toY: toY,
        color: color,
        width: 15,
        borderRadius :BorderRadius.only(
            topLeft: Radius.circular(11),
            topRight: Radius.circular(11)));
  }
}
