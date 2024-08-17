import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gov_data/src/features/providers/providers.dart';
import 'package:intl/intl.dart';


class ChartScreen extends ConsumerWidget {
  const ChartScreen({super.key});

  static const routePath="/Chart-Screen";
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final dataSheet1=ref.watch(crudeOilData);
    return Scaffold(
      appBar: AppBar(
        title:const Text("Monthly Crude Oil Processed by Refineries",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
        leading: const Icon(Icons.menu),
        titleSpacing:0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(color: Colors.amber,height: 10,),
            dataSheet1.when(data:(data){
             return DataTable(
              headingTextStyle:const TextStyle(fontSize:15,fontWeight: FontWeight.bold),
              columnSpacing:8,
              dataRowMaxHeight:70,
              columns: const[
                  DataColumn(label: Text('Oil Company')),
                  DataColumn(label: Text('Months')),
                  DataColumn(label: Text('Year')),
                  DataColumn(label: Text('Unit(Ton\'s)')),
              ],rows:List.generate(data.records.length,(index){
               return DataRow(
                cells: [
                    DataCell(SizedBox(
                      width:100,height:60,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(data.records[index].oilCompanies,maxLines: 3,)))),
                    DataCell(Text(data.records[index].month.name)),
                    DataCell(Text(data.records[index].year)),
                    DataCell(Text(data.records[index].quantity000MetricTonnes)),
                  ]);
              }),);
            }, error:(error,stackTrack){
              return Scaffold(body: Center(child: Text(error.toString()),),);
            }, loading:(){
              return const Center(child: CircularProgressIndicator(),);
            })
        ],),
      ),
    );
  }
  String formatDate(String isoDateString) {
    DateTime dateTime = DateTime.parse(isoDateString);
    return DateFormat('yyyy-MM-dd').format(dateTime); // Example: "2023-06-22"
  }
}