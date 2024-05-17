import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome, Mangcoding",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Let's schedule your activities",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.white)),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Schedule",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Let's schedule your activities",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.grey),
                      )
                    ],
                  ),
                  Switch(
                    value: true,
                    onChanged: (check) {},
                    activeColor: Colors.blue,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              GetMonth(),
              const SizedBox(
                height: 20,
              ),
              Divider(),
              const SizedBox(
                height: 20,
              ),
              GetTwoCon(),
              const SizedBox(
                height: 20,
              ),
              GetLastContainer(),
              const SizedBox(
                height: 20,
              ),
              GetLastContainer(),
              const SizedBox(
                height: 20,
              ),
              GetLastContainer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.edit,
                color: Colors.grey,
              ),
              label: "Schedule"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
                color: Colors.grey,
              ),
              label: "Calendar"),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person,
                color: Colors.grey,
              ),
              label: "Profile"),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          backgroundColor: Color(0xff4155FA),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class GetMonth extends StatelessWidget {
  GetMonth({super.key});

  List letters = ["T", "M", "W", "T", "S", "F", "S"];
  List days = ["16", "17", "18", "19", "20", "21", "22"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: Colors.grey.shade200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  "January 2024",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 30,
                ),
                Spacer(),
                Icon(Icons.add)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < letters.length; i++)
                  Text(
                    letters[i],
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: letters[i] == "S" ? Colors.red : null),
                  )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < days.length; i++)
                  Text(
                    days[i],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: days[i] == "21" || days[i] == "22"
                            ? Colors.red
                            : null),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GetTwoCon extends StatelessWidget {
  const GetTwoCon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.blueAccent.shade700),
              child: const Text(
                "All",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 65,
              child: const Text(
                "New",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GetLastContainer extends StatelessWidget {
  const GetLastContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: Colors.grey.shade200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(
                Icons.calendar_month,
                color: Colors.blueAccent,
              ),
              SizedBox(
                width: 3,
              ),
              Text("Sun, 20/1/2023"),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.access_time,
                color: Colors.blueAccent,
              ),
              SizedBox(
                width: 3,
              ),
              Text("10.00 AM - 01.00 PM"),
              Spacer(),
              Icon(
                CupertinoIcons.ellipsis_vertical,
                size: 20,
              )
            ],
          ),
          const Text(
            "Development of Software for the protection of information resources",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: const Alignment(-1, 0),
                child: Image.asset(
                  "assets/images/person1.png",
                  height: 35,
                  width: 35,
                ),
              ),
              Align(
                alignment: const Alignment(-0.85, 0),
                child: Image.asset(
                  "assets/images/person1.png",
                  height: 35,
                  width: 35,
                ),
              ),
              Align(
                alignment: const Alignment(-0.7, 0),
                child: Image.asset(
                  "assets/images/person1.png",
                  height: 35,
                  width: 35,
                ),
              ),
              Align(
                alignment: const Alignment(1, 0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.red.shade100),
                  child: const Text(
                    "Urgent",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
