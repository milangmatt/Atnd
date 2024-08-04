// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class SubTile extends StatefulWidget {
  final String SubAbbr;
  final String SubName;
  final int Attended;
  final int Total;
  final VoidCallback AttendClass;
  final VoidCallback AbsentClass;

  const SubTile({
    super.key,
    required this.SubAbbr,
    required this.SubName,
    required this.Attended,
    required this.Total,
    required this.AttendClass,
    required this.AbsentClass,
  });

  @override
  State<SubTile> createState() => _SubTileState();
}

class _SubTileState extends State<SubTile> {
  @override
  Widget build(BuildContext context) {
    var percent = ((widget.Attended / widget.Total) * 100) ~/ 1;
    return Container(
        padding: EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 16),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.SubAbbr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        widget.SubName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      '${widget.Attended}/${widget.Total}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Container(
                    alignment: Alignment.center,
                    child: percent < 100
                        ? Text(
                            '$percent',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 70,
                            ),
                          )
                        : Icon(
                            Icons.check_circle_outline_outlined,
                            size: 70,
                            color: Colors.green[400],
                          )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: widget.AbsentClass,
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red[200]),
                      iconColor: WidgetStatePropertyAll(Colors.red[900]),
                      iconSize: WidgetStatePropertyAll(30)),
                  child: Icon(Icons.arrow_circle_down),
                ),
                ElevatedButton(
                  onPressed: widget.AttendClass,
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.green[200]),
                      iconColor: WidgetStatePropertyAll(Colors.green[900]),
                      iconSize: WidgetStatePropertyAll(30)),
                  child: Icon(Icons.arrow_circle_up_outlined),
                ),
              ],
            )
          ],
        ));
  }
}
