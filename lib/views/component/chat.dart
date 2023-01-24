import 'package:flutter/material.dart';
import '../res/global.dart';

class ChatComponent extends StatefulWidget {
  const ChatComponent({Key? key}) : super(key: key);

  @override
  State<ChatComponent> createState() => _ChatComponentState();
}

class _ChatComponentState extends State<ChatComponent> {
  TextStyle myText = TextStyle(
      fontSize: 14, color: Colors.grey.shade500, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: (Global.isIos)?Colors.white:Colors.black,
      child: SingleChildScrollView(
        child: Column(
          children: Global.numberList
              .map(
                (e) => Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child:  CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(e['image']),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${e['name']}", style: TextStyle(fontSize: 16, color: (Global.isIos)?Colors.black:Colors.white, fontWeight: FontWeight.w500,)),
                                  Text("${e['subtitle']}", style: myText),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 5),
                              child: Text("${e['time']}", style: myText),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Align(alignment: Alignment.centerRight,child: Container(color: (Global.isIos)?Colors.grey.shade300:Colors.black,height: 1,width: MediaQuery.of(context).size.width*0.75)),
                    ],
                  ),
                ),
          )
              .toList(),
        ),
      ),
    );
  }
}
