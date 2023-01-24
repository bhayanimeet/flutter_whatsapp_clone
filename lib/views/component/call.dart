import 'package:flutter/material.dart';
import '../res/global.dart';

class CallComponent extends StatefulWidget {
  const CallComponent({Key? key}) : super(key: key);

  @override
  State<CallComponent> createState() => _CallComponentState();
}

class _CallComponentState extends State<CallComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: (Global.isIos)?Colors.white:Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green.shade800,
                      child: const Icon(Icons.link),
                    ),
                  ),
                  const SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Create call link",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Share a link for your whatsapp call",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Recent",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 15),
              ...Global.callList.map(
                (e) => Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            e['image'],
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
                                    color: (Global.isIos)?Colors.black:Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                "${e['time']}",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            Global.phone(
                              contact: e['number'],
                            );
                          },
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                e['icon'],
                                color: (Global.isIos)?Colors.black:Colors.white,
                              )),
                        ),
                      ),
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
