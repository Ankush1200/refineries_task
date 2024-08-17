import 'package:flutter/material.dart';
import 'package:gov_data/src/constants/style.dart';

Widget customContainer({VoidCallback? onPressed, String ?title, String? orgName,
  String?sector, String?orgType, String ?updatedOn,String?createdOn 
}) {
  return GestureDetector(
    onTap:onPressed,
    child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.deepPurpleAccent[100],
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                spreadRadius:5,
                blurStyle: BlurStyle.outer,
                color: Colors.purple,
              )
            ]),
        child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(flex: 1, child: Icon(Icons.settings)),
                      Expanded(
                        flex: 6,
                        child: Column(
                          children: [
                            Text("$title",
                                softWrap: true,
                                overflow: TextOverflow.visible,
                                style: AppTheme.heading1),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                    width: double.infinity,
                  ),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 60,
                      color: const Color.fromARGB(255, 220, 211, 211),
                      child:Text("$orgName")),
                  const SizedBox(
                    height: 10,
                    width: double.infinity,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Sector",
                            style: AppTheme.heading1,
                          ),
                          Text("$sector"),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Icon(Icons.watch_later),
                              SizedBox(
                                width: 2,
                              ),
                              Text("Updated On", style: AppTheme.heading1),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 25,
                              ),
                              Text("$updatedOn")
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Organization Type",
                            style: AppTheme.heading1,
                          ),
                          Text("$orgType"),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Icon(Icons.watch_later_outlined),
                              SizedBox(
                                width: 2,
                              ),
                              Text("Created On", style: AppTheme.heading1),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 25,
                              ),
                              Text("$createdOn"), 
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
    ),
  );
}
