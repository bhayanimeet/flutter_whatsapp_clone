import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr_1_3/views/component/call.dart';
import 'package:pr_1_3/views/component/chat.dart';
import 'package:pr_1_3/views/component/status.dart';
import 'package:pr_1_3/views/res/global.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isTrue = false;
  int currentIndex = 0;
  int currentPage = 0;
  dynamic myIcon = const Icon(Icons.message);
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    if ((Global.isIos)) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: CupertinoPageScaffold(
          resizeToAvoidBottomInset: false,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                IndexedStack(
                  index: currentPage,
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: CupertinoSwitch(
                              value: Global.isIos,
                              onChanged: (val) {
                                setState(() {
                                  Global.isIos = val;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text("Privacy",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue)),
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              "Status",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.grey.shade300,
                          ),
                          const StatusComponent(),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: CupertinoSwitch(
                              value: Global.isIos,
                              onChanged: (val) {
                                setState(() {
                                  Global.isIos = val;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Calls",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.grey.shade300,
                                  child: const Icon(Icons.link),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Create call link",
                                    style: TextStyle(
                                        color: Colors.blue,
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
                              child: GestureDetector(
                                onTap: () {
                                  Global.phone(
                                    contact: e['number'],
                                  );
                                },
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
                                      flex: 4,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                            const SizedBox(height: 3),
                                            Text(
                                              "Incoming",
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
                                      flex: 4,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "${e['time2']}  ",
                                            style: TextStyle(
                                                color: Colors.grey.shade500),
                                          ),
                                          const Icon(
                                            Icons.info_outline,
                                            color: Colors.blue,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: CupertinoSwitch(
                                value: Global.isIos,
                                onChanged: (val) {
                                  setState(() {
                                    Global.isIos = val;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text("Communities",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 35)),
                            const SizedBox(height: 20),
                            Center(
                                child:
                                    Image.asset('assets/images/community.png')),
                            const SizedBox(height: 20),
                            const Text("Introducing Communities",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24)),
                            const SizedBox(height: 15),
                            Text(
                                '''Easily organize your related groups and send announcements. Now, your communities, like neighbourhoods or schools, can have their own space.''',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19)),
                            const SizedBox(height: 30),
                            CupertinoTextField(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.shade600, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              placeholder: "Start a community",
                              placeholderStyle: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: CupertinoSwitch(
                              value: Global.isIos,
                              onChanged: (val) {
                                setState(() {
                                  Global.isIos = val;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Chats",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Broadcast Lists",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "New Group",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.grey.shade300),
                          const SizedBox(height: 5),
                          const ChatComponent(),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: CupertinoSwitch(
                              value: Global.isIos,
                              onChanged: (val) {
                                setState(() {
                                  Global.isIos = val;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Settings",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30)),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CupertinoTabBar(
                  backgroundColor: Colors.white,
                  onTap: (val) {
                    setState(() {
                      currentPage = val;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.circle_fill),
                      label: "Status",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.phone),
                      label: "Calls",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.person_3),
                      label: "Communities",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.chat_bubble_2_fill),
                      label: "Chats",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.settings),
                      label: "Setting",
                    ),
                  ],
                  currentIndex: currentPage,
                  inactiveColor: CupertinoColors.systemGrey2.color,
                  activeColor: CupertinoColors.activeBlue.darkElevatedColor,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff1f2c34),
            title: Text(
              "Whatsapp",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade300),
            ),
            elevation: 0,
            actions: [
              Switch(
                value: Global.isIos,
                onChanged: (val) {
                  setState(() {
                    Global.isIos = val;
                  });
                },
              ),
              const Icon(Icons.search, color: Colors.white),
              const SizedBox(width: 5),
              const Icon(Icons.more_vert, color: Colors.white),
              const SizedBox(width: 5),
            ],
            bottom: TabBar(
              indicatorWeight: 2,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.white,
              labelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              controller: tabController,
              onTap: (val) {
                setState(() {
                  pageController.animateToPage(val,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                  currentIndex = val;
                  if (currentIndex == 0) {
                    myIcon = const Icon(Icons.message);
                  } else if (currentIndex == 1) {
                    myIcon = const Icon(Icons.camera_alt_rounded);
                  } else if (currentIndex == 2) {
                    myIcon = const Icon(Icons.add_call);
                  }
                });
              },
              tabs: const [
                Tab(text: "Chats"),
                Tab(text: "Status"),
                Tab(text: "Calls"),
              ],
            ),
          ),
          backgroundColor: Colors.black,
          body: PageView(
            controller: pageController,
            onPageChanged: (val) {
              setState(() {
                tabController.animateTo(val);
                currentIndex = val;
                if (currentIndex == 0) {
                  myIcon = const Icon(Icons.message);
                } else if (currentIndex == 1) {
                  myIcon = const Icon(Icons.camera_alt_rounded);
                } else if (currentIndex == 2) {
                  myIcon = const Icon(Icons.add_call);
                }
              });
            },
            children: const [
              ChatComponent(),
              StatusComponent(),
              CallComponent(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            backgroundColor: Colors.green.shade800,
            child: myIcon,
          ),
        ),
      );
    }
  }
}
