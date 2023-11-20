import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ),
        ),
        body: const MonthTask(),
      ),
    );
  }
}

class MonthTask extends StatefulWidget {
  const MonthTask({Key? key}) : super(key: key);

  @override
  MonthTaskState createState() => MonthTaskState();
}

class MonthTaskState extends State<MonthTask> {
  List<DateTime> days = [];
  DateTime selectedDate = DateTime.now();
  Color textColor = Colors.black;

  @override
  void initState() {
    super.initState();
    days = getDaysInMonth(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Today',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    fixedSize: const Size(
                      100,
                      35,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        19,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Add Task',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                'Productive Day, Sourav',
                style: TextStyle(
                  fontSize: 27,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'April, 2020',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 20,
              top: 20,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getApril2020Days(),
              ),
            ),
          ),
          Expanded(child: buildTimeRow()),
        ],
      ),
    );
  }

  Widget buildTimeRow() {
    List<String> times = [
      '9 PM',
      '10 PM',
      '11 PM',
      '12 AM',
      '1 AM',
      '2 AM',
      '3 AM',
      '4 AM',
      '5 AM',
      '6 AM',
      '7 AM',
      '8 AM',
      '9 AM'
    ];

    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: times.map(
                (time) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      time,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 2,
                width: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 50,
                  itemBuilder: (ctx, val) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      height: 10,
                      width: 8,
                      color: const Color.fromARGB(255, 221, 221, 221),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                width: 240,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 247, 229, 207),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Your Text Here',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 2,
                width: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 50,
                  itemBuilder: (ctx, val) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      height: 10,
                      width: 8,
                      color: const Color.fromARGB(255, 214, 214, 214),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                width: 240,
                height: 95,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 195, 227, 252),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: 240,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                    255,
                    247,
                    199,
                    215,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> getApril2020Days() {
    List<Widget> daysList = [];

    for (DateTime date in days) {
      String dayName = getDayName(date.weekday);
      daysList.add(
        GestureDetector(
          onTap: () {
            setState(() {
              selectedDate = date;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dayName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: date == selectedDate ? Colors.red : Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${date.day}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: date == selectedDate ? Colors.red : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return daysList;
  }

  List<DateTime> getDaysInMonth(DateTime month) {
    int year = month.year;
    int daysInMonth = DateTime(year, month.month + 1, 0).day;

    return List<DateTime>.generate(
      daysInMonth,
      (index) => DateTime(
        year,
        month.month,
        index + 1,
      ),
    );
  }

  String getDayName(int day) {
    switch (day) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }
}
