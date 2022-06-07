import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';



class MataPelajaran extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<MataPelajaran> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          padding: EdgeInsets.all(10),
          height: 100,
          decoration: BoxDecoration(
              color: mFillColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: mBorderColor, width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "07:00",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "PAGI",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ],
              ),
              Container(
                height: 100,
                width: 1,
                color: Colors.grey.withOpacity(0.5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      "Matematika",
                      overflow: TextOverflow.ellipsis,
                      style: (TextStyle(fontWeight:  FontWeight.bold)),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.class__rounded,
                        color: Colors.grey,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 160,
                        child: Text(
                          "X IPA 1",
                          overflow: TextOverflow.ellipsis,
                          style:
                          TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=200&q=80"),
                        radius: 10,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Ahmad Cucus Ph.D",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}