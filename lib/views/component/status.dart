import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/global.dart';

class StatusComponent extends StatefulWidget {
  const StatusComponent({Key? key}) : super(key: key);

  @override
  State<StatusComponent> createState() => _StatusComponentState();
}

class _StatusComponentState extends State<StatusComponent> {
  TextStyle myText = TextStyle(
      fontSize: 14, color: Colors.grey.shade500, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: (Global.isIos) ? Colors.white : Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8, top: 8),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage('assets/images/profile.jpg'),
                          ),
                        ),
                        CircleAvatar(
                          radius: 12,
                          backgroundColor:
                              (Global.isIos) ? Colors.white : Colors.black,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: (Global.isIos)
                                ? Colors.blue
                                : Colors.green.shade800,
                            child: const Icon(Icons.add, size: 10),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My status",
                          style: TextStyle(
                              color: (Global.isIos)
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Tap to add status update",
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(width: 54),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: (Global.isIos)
                          ? Colors.grey.shade400
                          : Colors.black,
                      child: Icon(Icons.camera_alt_rounded,
                          color: (Global.isIos) ? Colors.blue : Colors.black,
                          size: 15),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: (Global.isIos)
                          ? Colors.grey.shade400
                          : Colors.black,
                      child: Icon(CupertinoIcons.pencil,
                          color: (Global.isIos) ? Colors.blue : Colors.black,
                          size: 15),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Recent Updates",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 10),
              ...Global.statusList.map(
                (e) => Container(
                  color: (Global.isIos) ? Colors.white : Colors.black,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: (Global.isIos)
                                  ? Colors.blue
                                  : Colors.green.shade800,
                              child: CircleAvatar(
                                radius: 33,
                                backgroundColor: (Global.isIos)
                                    ? Colors.white
                                    : Colors.black,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                    e['image'],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${e['name']}",
                                    style: TextStyle(
                                        color: (Global.isIos)
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "${e['time']}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade500,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 1),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              color: (Global.isIos)
                                  ? Colors.grey.shade300
                                  : Colors.black,
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.7)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
