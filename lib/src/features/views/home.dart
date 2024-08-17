import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gov_data/src/features/providers/providers.dart';
import 'package:gov_data/src/features/views/chart.dart';
import 'package:gov_data/src/features/widgets/custom_container.dart';
import 'package:intl/intl.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const routePath = "/Home-Screen";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataSheet1 = ref.watch(crudeOilData);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Top Refineries",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.pink,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.red,
              ),
            )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,width: double.infinity,),
          dataSheet1.when(data: (data) {
            return customContainer(
              onPressed: () {
                context.go(ChartScreen.routePath);
              },
              title: data.title,
              orgName: "${data.org[0]},${data.org[1]}",
              sector: data.sector[0].toString(),
              orgType: data.orgType,
              updatedOn: formatDate("${data.updatedDate}"),
              createdOn: formatDate("${data.createdDate}")
            );
          }, error: (error, stackTreck) {
            return Center(
              child: Text("Error: ${error.toString()}"),
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
          // Similerlly Rest of the API chart Will be displayed
        ],
      ),
    );
  }
  String formatDate(String isoDateString) {
    DateTime dateTime = DateTime.parse(isoDateString);
    return DateFormat('yyyy-MM-dd').format(dateTime); // Example: "2023-06-22"
  }
}
