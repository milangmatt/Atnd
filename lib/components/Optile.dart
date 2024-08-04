// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Optile extends StatelessWidget {
  final String SubAbbr;
  final String SubName;
  final int Attended;
  final int Total;
  final Function(BuildContext)? DeleteSubject;
  final Function(BuildContext)? EditSubject;

  const Optile({
    super.key,
    required this.SubAbbr,
    required this.SubName,
    required this.Attended,
    required this.Total,
    required this.DeleteSubject,
    required this.EditSubject,
  });

  @override
  Widget build(BuildContext context) {
    var percent = ((((Attended / Total) * 100) * 10) ~/ 1) / 10;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: DeleteSubject,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
            ),
            SlidableAction(
              onPressed: EditSubject,
              icon: Icons.edit,
              backgroundColor: Color.fromARGB(255, 14, 14, 14),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 80,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: percent > 90
                          ? Colors.green
                          : percent > 75
                              ? Colors.yellow
                              : Colors.red,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        SubAbbr,
                        style: TextStyle(
                          height: 1,
                          color: Colors.white,
                          fontSize: 48,
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          SubName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        '$Attended/$Total',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                (percent != 100) ? '$percent%' : '100%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
