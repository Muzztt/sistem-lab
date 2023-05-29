import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tes_2/core.dart';
import 'package:tes_2/pages/home_page/home_page.dart';
import '../../../state_util.dart';
import '../controller/datamaster_controller.dart';

class DatamasterView extends StatefulWidget {
  DatamasterView({Key? key}) : super(key: key);

  Widget build(context, DatamasterController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Color(0xffe6fbe3),
      body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    "assets/images/computer.png",
                    width: 60.0,
                    height: 60.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                  ),
                  child: Text(
                    "DataMaster",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff5c5c5c),
                    ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("datamaster")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return const Text("Error");
                      if (snapshot.data == null) return Container();
                      if (snapshot.data!.docs.isEmpty) {
                        return const Text("No Data");
                      }
                      final data = snapshot.data!;
                      return ListView.builder(
                        itemCount: data.docs.length,
                        padding: EdgeInsets.zero,
                        clipBehavior: Clip.none,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> item =
                              (data.docs[index].data() as Map<String, dynamic>);
                          item["id"] = data.docs[index].id;
                          return Card(
                            color: Color(0xffb4c8b1),
                            child: Slidable(
                              endActionPane: ActionPane(
                                motion: StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) =>
                                        controller.delete(item),
                                    backgroundColor: Colors.red,
                                    icon: Icons.delete,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                title: Text(item["full_name"]),
                                subtitle: Text(item["email"]),
                                trailing: Text(
                                  item["loan"],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(
            24), // Atur radius untuk membuatnya agak kotak
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color(0xff2a9235),
          onPressed: () {
            Get.to(HomePage());
          },
        ),
      ),
    );
  }

  @override
  State<DatamasterView> createState() => DatamasterController();
}
