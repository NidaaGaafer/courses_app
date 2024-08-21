import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses_app/models/courses.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CourseInformation extends StatefulWidget {
  final String rankValue;
  const CourseInformation({super.key, required this.rankValue});

  @override
  State<CourseInformation> createState() => _CourseInformationState();
}

class _CourseInformationState extends State<CourseInformation> {
  late Future<QuerySnapshot<Map<String, dynamic>>> futureCall;
  @override
  void initState() {
    futureCall = FirebaseFirestore.instance
        .collection('courses')
        .where('rank', isEqualTo: widget.rankValue)
        .get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('courses')
                  .where(
                    'rank',
                  )
                  .get(),
              builder: (ctx, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                var courses = List<Course>.from(snapshot.data?.docs
                        .map((e) => Course.fromJson({'id': e.id, ...e.data()}))
                        .toList() ??
                    []);
                return Container(
                  child: Column(
                    children: [
                      Image.asset('assets/images/'),
                      Row(
                        children: [Text(''), Container()],
                      ),
                      Text(
                        'title',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Icon(Icons.person),
                          Text('instsructor'),
                          Text('\$price'),
                        ],
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
